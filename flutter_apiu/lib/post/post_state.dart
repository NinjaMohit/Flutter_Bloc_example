// lib/blocs/post/post_state.dart
import 'package:equatable/equatable.dart';
import 'package:flutter_apiu/model/post_model.dart';

class PostState extends Equatable {
  final bool isLoading;
  final List<Post> posts;
  final String? error;

  const PostState({
    this.isLoading = false,
    this.posts = const [],
    this.error,
  });

  PostState copyWith({
    bool? isLoading,
    List<Post>? posts,
    String? error,
  }) {
    return PostState(
      isLoading: isLoading ?? this.isLoading,
      posts: posts ?? this.posts,
      error: error,
    );
  }

  @override
  List<Object?> get props => [isLoading, posts, error];
}
