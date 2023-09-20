import 'dart:convert';

import 'package:cleaarchapp/core/constants.dart';
import 'package:cleaarchapp/core/errors/Exceptions.dart';
import 'package:dartz/dartz.dart';

import '../../Domain/entites/Posts.dart';
import '../model/PostsModel.dart';
import 'package:http/http.dart' as http;

abstract class PostsDataProviders {
  Future<List<PostsModel>> getAllPosts();
  Future<Unit> addPost(Posts post);
  Future<Unit> deletePost(int id);
}

class PostsDataWithHttp implements PostsDataProviders {
  @override
  Future<List<PostsModel>> getAllPosts() async {
    try {
      var response = await http.get(Uri.parse(base_url + '/posts'));
      List<PostsModel> posts = jsonDecode(response.body)
          .map<PostsModel>((e) => PostsModel.fromJson(e))
          .toList();
      print(response.body);
      return posts;
    } catch (e) {
      print(e);
      throw ServicesException();
    }
  }

  @override
  Future<Unit> addPost(Posts post) async {
    try {
      var response = await http.post(Uri.parse(base_url + '/posts'),
          body: jsonEncode(
            {
              "userId": post.userId,
              "id": post.id,
              "title": post.title,
              "body": post.body
            },
          ));
      int id = jsonDecode(response.body)['id'];
      return unit;
    } catch (e) {
      print(e);
      throw ServicesException();
    }
  }

  @override
  Future<Unit> deletePost(int id) async {
    try {
      var response = await http.post(Uri.parse(base_url + "/Posts/$id"));

      return unit;
    } catch (e) {
      throw ServicesException();
    }
  }
}
