import 'package:todo_bloc_app/models/todo_model.dart';
import 'package:equatable/equatable.dart';

class MainScreenState extends Equatable {
  final List<ToDoModel> toDos;

  const MainScreenState({this.toDos = const []});

  MainScreenState copyWith({List<ToDoModel>? toDos}) =>
      MainScreenState(toDos: toDos ?? this.toDos);

  @override
  List<Object> get props => [toDos];
}
