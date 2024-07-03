import 'package:todo_bloc_app/models/todo_model.dart';
import 'package:equatable/equatable.dart';

sealed class ToDoEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddToDoEvent extends ToDoEvent {
  final ToDoModel toDo;
  AddToDoEvent({required this.toDo});
  @override
  List<Object> get props => [toDo];
}

class DeleteToDoEvent extends ToDoEvent {
  final ToDoModel toDo;
  DeleteToDoEvent({required this.toDo});
  @override
  List<Object> get props => [toDo];
}

class SelectToDoEvent extends ToDoEvent {
  final ToDoModel toDo;
  SelectToDoEvent({required this.toDo});
  @override
  List<Object> get props => [toDo];
}
