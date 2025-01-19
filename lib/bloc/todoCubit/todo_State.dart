import 'package:flutter_application_1/models/todoModel.dart';

abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoSuccess extends TodoState {
  List<TodoModel>? todolist;

  TodoSuccess(this.todolist);
}

class TodoFailure extends TodoState {}
