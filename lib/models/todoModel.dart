import 'package:flutter/material.dart';

class TodoModel
{
  int? id;
  String? todo;
  bool?isDone;
  int?userId;
  TodoModel({required this.id,required this.todo,required this.isDone,required this.userId});

  factory TodoModel.fromjson(dynamic data)
  {
    return TodoModel(
      id: data['id'],
       todo: data['todo'],
        isDone: data['completed'], 
        userId: data['userId']
        );
  }
}