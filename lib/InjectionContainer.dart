import 'package:cleaarchapp/features/Posts/Data/DataProviders/PostsDataProviders.dart';
import 'package:cleaarchapp/features/Posts/Domain/UseCases/AddpostUseCase.dart';
import 'package:cleaarchapp/features/Posts/Domain/UseCases/DeletePostUsecase.dart';
import 'package:cleaarchapp/features/Posts/Presentaion/Blocs/bloc/add_delete_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'features/Posts/Data/repositryImplemetaion/PostReposImplementaion.dart';
import 'features/Posts/Domain/UseCases/GetAllPostUseCase.dart';
import 'features/Posts/Domain/repositries/PostsRepositries.dart';
import 'features/Posts/Presentaion/Blocs/bloc/get_all_posts_bloc.dart';

final GetIt dependcy = GetIt.instance;

Future<void> dependecy_init() async {
//Blocs & Cubit
  dependcy.registerFactory(() => GetAllPostsBloc(dependcy()));
  dependcy.registerFactory(() => AddDeleteBloc(dependcy(), dependcy()));

  //Use Cases
  dependcy.registerLazySingleton(
      () => GetAllPostsUseCase(postsShowRepositries: dependcy()));
  dependcy.registerLazySingleton(
      () => DeletePostUseCase(postsRepositries: dependcy()));
  dependcy.registerLazySingleton(
      () => AddPostsUseCase(postsRepositries: dependcy()));

  //repositry
  dependcy
      .registerLazySingleton<PostsRepositries>(() => PostsREposImplementaion(
            postsDataProviders: dependcy(),
          ));
  //Data Providers
  //global

  dependcy.registerLazySingleton<PostsDataProviders>(() => PostsDataWithHttp());

  /// core
  dependcy.registerLazySingleton(() => http.Client());
}
