// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:cleaarchapp/core/errors/failures.dart';
import 'package:cleaarchapp/features/Posts/Domain/repositries/PostsRepositries.dart';

import '../entites/Posts.dart';

class AddPostsUseCase {
  final PostsRepositries postsRepositries;
  AddPostsUseCase({
    required this.postsRepositries,
  });
  Future<Either<Failures, Unit>> call(Posts post) {
    return postsRepositries.addPost(post);
  }
}
