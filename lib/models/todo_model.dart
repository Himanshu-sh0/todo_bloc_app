import 'package:equatable/equatable.dart';

class ToDoModel extends Equatable {
  final int id;
  final String toDoTitle;
  final String toDoContent;
  final DateTime date;
  final bool isSelected;

  const ToDoModel({
    required this.id,
    required this.toDoTitle,
    required this.toDoContent,
    required this.date,
    this.isSelected = false,
  });

  ToDoModel copyWith(
          {int? id,
          String? toDoTitle,
          String? toDoContent,
          DateTime? date,
          bool? isSelected}) =>
      ToDoModel(
          id: id ?? this.id,
          toDoTitle: toDoTitle ?? this.toDoTitle,
          toDoContent: toDoContent ?? this.toDoContent,
          date: date ?? this.date,
          isSelected: isSelected ?? this.isSelected);
  @override
  List<Object> get props => [id, toDoTitle, toDoContent, date, isSelected];
}
