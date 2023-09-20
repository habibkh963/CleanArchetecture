import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositries/PostsRepositries.dart';

class DeletePostUseCase {
  final PostsRepositries postsRepositries;
  DeletePostUseCase({
    required this.postsRepositries,
  });
  Future<Either<Failures, Unit>> call(int id) {
    return postsRepositries.deletePost(id);
  }
}
