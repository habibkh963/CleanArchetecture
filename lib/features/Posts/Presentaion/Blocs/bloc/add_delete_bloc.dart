import 'package:bloc/bloc.dart';
import 'package:cleaarchapp/core/errors/failures.dart';
import 'package:cleaarchapp/features/Posts/Domain/UseCases/AddpostUseCase.dart';
import 'package:cleaarchapp/features/Posts/Domain/UseCases/DeletePostUsecase.dart';
import 'package:meta/meta.dart';

import '../../../../../core/constants.dart';
import '../../../Domain/entites/Posts.dart';

part 'add_delete_event.dart';
part 'add_delete_state.dart';

class AddDeleteBloc extends Bloc<AddDeleteEvent, AddDeleteState> {
  final AddPostsUseCase addPostsUseCase;
  final DeletePostUseCase deletePostUseCase;
  AddDeleteBloc(this.addPostsUseCase, this.deletePostUseCase)
      : super(AddDeleteInitial()) {
    on<AddEvent>((event, emit) async {
      emit(AddDeleteInitial());
      var res = await addPostsUseCase.call(event.post);
      res.fold((l) => emit(ErrorState(msg: mapFailuresToStrings(l))),
          (r) => emit(SuccessfullState()));
    });
    on<DeleteEvent>((event, emit) async {
      emit(AddDeleteInitial());
      var res = await deletePostUseCase.call(event.id);
      res.fold((l) => emit(ErrorState(msg: mapFailuresToStrings(l))),
          (r) => emit(SuccessfullState()));
    });
    on<AddPostEvent>((event, emit) async {
      emit(AddDeleteInitial());
      var res = await addPostsUseCase.call(event.post);
      res.fold((l) => emit(ErrorState(msg: mapFailuresToStrings(l))),
          (r) => emit(SuccessfullState()));
    });
  }
}
