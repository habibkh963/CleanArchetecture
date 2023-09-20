// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_all_posts_bloc.dart';

@immutable
sealed class GetAllPostsState {}

final class GetAllPostsLoading extends GetAllPostsState {}

class GetAllPostsLoaded extends GetAllPostsState {
  final List<Posts> posts;
  GetAllPostsLoaded({
    required this.posts,
  });
}

class LoadingErrorState extends GetAllPostsState {
  final String msg;
  LoadingErrorState({
    required this.msg,
  });
}
