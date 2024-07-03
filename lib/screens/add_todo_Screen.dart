import 'package:todo_bloc_app/bloc/main_screen_bloc.dart';
import 'package:todo_bloc_app/bloc/main_screen_event.dart';
import 'package:todo_bloc_app/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddtoDoScreen extends StatefulWidget {
  const AddtoDoScreen({
    super.key,
  });

  @override
  AddtoDoScreenState createState() => AddtoDoScreenState();
}

class AddtoDoScreenState extends State<AddtoDoScreen> {
  late final TextEditingController toDoTitle;
  late final TextEditingController toDoContent;

  @override
  void initState() {
    toDoTitle = TextEditingController();
    toDoContent = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print("running add toDo screen build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add toDo!"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: toDoTitle,
              decoration: const InputDecoration(hintText: "Title..."),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: TextField(
                controller: toDoContent,
                decoration: const InputDecoration(
                    hintText: "Content...", border: InputBorder.none),
                expands: true,
                maxLines: null,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  if (toDoTitle.text == '' && toDoContent.text == '') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please add a toDo"),
                        showCloseIcon: true,
                        margin: EdgeInsets.all(5),
                        behavior: SnackBarBehavior.floating,
                        duration: Duration(seconds: 1),
                      ),
                    );
                  } else {
                    final toDo = ToDoModel(
                      id: context.read<ToDoBloc>().state.toDos.length,
                      toDoTitle: toDoTitle.text,
                      toDoContent: toDoContent.text,
                      date: DateTime.now(),
                    );
                    context.read<ToDoBloc>().add(
                          AddToDoEvent(toDo: toDo),
                        );
                    Navigator.of(context).pop();
                  }
                },
                child: const Text("Add!"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
