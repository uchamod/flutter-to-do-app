part of 'to_do_bloc_bloc.dart';
//to do events
abstract class ToDoBlocEvent extends Equatable {
  const ToDoBlocEvent();

  @override
  List<Object> get props => [];
}
//start event
class TodoStarted extends ToDoBlocEvent {}

//add event
class AddToDo extends ToDoBlocEvent {
  final ToDo todo;
  const AddToDo(this.todo);

  @override
  List<Object> get props => [todo];
}

//remove event
class RemoveToDo extends ToDoBlocEvent {
  final ToDo todo;

  const RemoveToDo({required this.todo});
}

//update event
class UpdateToDo extends ToDoBlocEvent {
  final int index;

  const UpdateToDo({required this.index});
  @override
  List<Object> get props => [index];
}
