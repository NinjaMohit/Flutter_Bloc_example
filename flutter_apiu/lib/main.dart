import 'package:flutter/material.dart';
import 'package:flutter_apiu/post/post_bloc.dart';
import 'package:flutter_apiu/repository/repository.dart';
import 'package:flutter_apiu/ui/post_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BLoC API Example',
      home: BlocProvider(
        create: (_) => PostBloc(postRepository: PostRepository()),
        child: const PostScreen(),
      ),
    );
  }
}
