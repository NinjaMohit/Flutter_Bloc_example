// import 'dart:convert';
// import 'package:flutter_apiu/model/post_model.dart';
// import 'package:http/http.dart' as http;

// class PostRepository {
//   Future<List<Post>> fetchPosts() async {
//     final response =
//         await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
//     if (response.statusCode == 200) {
//       final List data = json.decode(response.body);
//       return data.map((json) => Post.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load posts');
//     }
//   }
// }
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import '../model/post_model.dart';

// class PostRepository {
//   Future<List<Post>> fetchPosts() async {
//     try {
//       final response = await http
//           .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

//       if (response.statusCode == 200) {
//         final List jsonData = json.decode(response.body);
//         return jsonData.map((json) => Post.fromJson(json)).toList();
//       } else {
//         throw Exception('Failed to load posts: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error fetching posts: $e');
//     }
//   }
// }
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/post_model.dart';

class PostRepository {
  Future<List<Post>> fetchPosts() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );

      if (response.statusCode == 200) {
        final List jsonData = json.decode(response.body);
        return jsonData.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load posts: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching posts: $e');
    }
  }
}
