import 'package:todo_bloc_app/bloc/main_screen_bloc.dart';
import 'package:todo_bloc_app/bloc/main_screen_event.dart';
import 'package:todo_bloc_app/bloc/main_screen_state.dart';
import 'package:todo_bloc_app/screens/add_todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    // print("running todo screen build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo App"),
        centerTitle: true,
      ),
      body: BlocBuilder<ToDoBloc, MainScreenState>(
        builder: (context, state) {
          // print("building todo bloc builder");
          return state.toDos.isEmpty
              ? const Center(child: Text("No Data"))
              : ListView.builder(
                  itemCount: state.toDos.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final currenttoDo = state.toDos.elementAt(index);

                    return ListTile(
                      leading: Checkbox(
                        value: state.toDos[index].isSelected,
                        onChanged: (_) {
                          context
                              .read<ToDoBloc>()
                              .add(SelectToDoEvent(toDo: currenttoDo));
                        },
                      ),
                      title: Text(index.toString() + currenttoDo.toDoTitle),
                      subtitle: Text(
                        currenttoDo.toDoContent,
                        maxLines: 1,
                        // softWrap: true,
                        style: const TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                      trailing: InkWell(
                        onTap: () {
                          context
                              .read<ToDoBloc>()
                              .add(DeleteToDoEvent(toDo: currenttoDo));
                        },
                        child: const Icon(Icons.delete),
                      ),
                    );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddtoDoScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
