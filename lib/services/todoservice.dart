
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/models/todoModel.dart';

class Todoservice {
  Dio dio = Dio();

  Future<List<TodoModel>> gettodoService() async {
   List<TodoModel> todolist = [];
    try {
      var response = await dio.get("https://dummyjson.com/todos");
      List<dynamic> tododata = response.data['todos'];
      for(int i=0;i<tododata.length;i++){
        todolist.add(TodoModel.fromjson(tododata[i]));
      }
      if (kDebugMode) {
        print(todolist.length);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    
    return todolist;
    
  }
}
