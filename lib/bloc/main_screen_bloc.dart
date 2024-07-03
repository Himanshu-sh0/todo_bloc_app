import 'package:bloc/bloc.dart';
import 'package:todo_bloc_app/bloc/main_screen_event.dart';
import 'package:todo_bloc_app/bloc/main_screen_state.dart';
import 'package:todo_bloc_app/models/todo_model.dart';

class ToDoBloc extends Bloc<ToDoEvent, MainScreenState> {
  ToDoBloc() : super(const MainScreenState()) {
    on<AddToDoEvent>(_addToDo);
    on<DeleteToDoEvent>(_deleteToDo);
    on<SelectToDoEvent>(_selectToDo);
  }
  List<ToDoModel> toDos = [];

  _addToDo(AddToDoEvent event, Emitter<MainScreenState> emit) {
    toDos.add(event.toDo);
    // print(toDos.length);
    emit(state.copyWith(toDos: List<ToDoModel>.from(toDos)));
  }

  _deleteToDo(DeleteToDoEvent event, Emitter<MainScreenState> emit) {
    toDos.remove(event.toDo);
    // print(toDos.length);
    emit(state.copyWith(toDos: List<ToDoModel>.from(toDos)));
  }

  _selectToDo(SelectToDoEvent event, Emitter<MainScreenState> emit) {
    ToDoModel toDo = event.toDo.copyWith(isSelected: !event.toDo.isSelected);
    toDos[toDo.id] = toDo;
    // print(toDos.length);
    emit(state.copyWith(toDos: List<ToDoModel>.from(toDos)));
  }
}
