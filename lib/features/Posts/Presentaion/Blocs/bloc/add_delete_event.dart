part of 'add_delete_bloc.dart';

@immutable
sealed class AddDeleteEvent {}

class AddEvent extends AddDeleteEvent {
  final Posts post;

  AddEvent(this.post);
}

class DeleteEvent extends AddDeleteEvent {
  final int id;

  DeleteEvent(this.id);
}

class AddPostEvent extends AddDeleteEvent {
  final Posts post;

  AddPostEvent(this.post);
}
