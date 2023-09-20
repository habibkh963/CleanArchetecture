// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cleaarchapp/features/Posts/Data/model/PostsModel.dart';
import 'package:dartz/dartz.dart';

import 'package:cleaarchapp/core/errors/Exceptions.dart';
import 'package:cleaarchapp/core/errors/failures.dart';
import 'package:cleaarchapp/features/Posts/Data/DataProviders/PostsDataProviders.dart';
import 'package:cleaarchapp/features/Posts/Domain/entites/Posts.dart';
import 'package:cleaarchapp/features/Posts/Domain/repositries/PostsRepositries.dart';

class PostsREposImplementaion extends PostsRepositries {
  final PostsDataProviders postsDataProviders;
  PostsREposImplementaion({
    required this.postsDataProviders,
  });
  @override
  Future<Either<Failures, List<Posts>>> getallPosts() async {
    try {
      List<PostsModel> posts = await postsDataProviders.getAllPosts();
      return Right(posts);
    } on ServicesException {
      return Left(ServiceFailure());
    }
  }

  @override
  Future<Either<Failures, Unit>> addPost(Posts post) async {
    try {
      await postsDataProviders.addPost(post);
      return Right(unit);
    } on ServicesException {
      return Left(ServiceFailure());
    }
  }

  @override
  Future<Either<Failures, Unit>> deletePost(int id) async {
    try {
      await postsDataProviders.deletePost(id);
      return Right(unit);
    } on ServicesException {
      return Left(ServiceFailure());
    }
  }
}
