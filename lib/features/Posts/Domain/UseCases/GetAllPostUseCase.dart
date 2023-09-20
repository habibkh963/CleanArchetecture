// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';

import 'package:cleaarchapp/core/errors/failures.dart';

import '../entites/Posts.dart';
import '../repositries/PostsRepositries.dart';

class GetAllPostsUseCase {
  final PostsRepositries postsShowRepositries;
  GetAllPostsUseCase({
    required this.postsShowRepositries,
  });

  Future<Either<Failures, List<Posts>>> call() async {
    return postsShowRepositries.getallPosts();
  }
}
