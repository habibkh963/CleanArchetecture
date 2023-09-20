import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entites/Posts.dart';

abstract class PostsRepositries {
  Future<Either<Failures, List<Posts>>> getallPosts();
  Future<Either<Failures, Unit>> addPost(Posts post);
  Future<Either<Failures, Unit>> deletePost(int id);
}
