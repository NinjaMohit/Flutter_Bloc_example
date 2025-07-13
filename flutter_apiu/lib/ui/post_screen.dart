import 'package:flutter/material.dart';
import 'package:flutter_apiu/post/post_bloc.dart';
import 'package:flutter_apiu/post/post_event.dart';
import 'package:flutter_apiu/post/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.error != null) {
            return Center(child: Text('Error: ${state.error}'));
          } else if (state.posts.isEmpty) {
            return const Center(child: Text('No posts loaded'));
          } else {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<PostBloc>().add(FetchPosts()),
        child: const Icon(Icons.download),
      ),
    );
  }
}
