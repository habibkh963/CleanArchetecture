import 'package:bloc/bloc.dart';
import 'package:cleaarchapp/features/Posts/Domain/UseCases/GetAllPostUseCase.dart';

import 'package:meta/meta.dart';

import '../../../../../core/constants.dart';
import '../../../Domain/entites/Posts.dart';

part 'get_all_posts_event.dart';
part 'get_all_posts_state.dart';

class GetAllPostsBloc extends Bloc<GetAllPostsEvent, GetAllPostsState> {
  final GetAllPostsUseCase getAllPostsUseCase;
  GetAllPostsBloc(this.getAllPostsUseCase) : super(GetAllPostsLoading()) {
    on<GetAllPostsEvent>((event, emit) async {
      emit(GetAllPostsLoading());
      var posts = await getAllPostsUseCase.call();
      posts.fold((l) => emit(LoadingErrorState(msg: mapFailuresToStrings(l))),
          (r) => emit(GetAllPostsLoaded(posts: r)));
    });
  }
}
