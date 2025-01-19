import 'package:flutter_application_1/bloc/todoCubit/todo_State.dart';
import 'package:flutter_application_1/models/todoModel.dart';
import 'package:flutter_application_1/services/todoservice.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<TodoState>{
  TodoCubit():super(TodoInitial());

  TodoModel?todoModel;
  List<TodoModel> todolist=[];
  void getTodos()async
  {
    emit(TodoLoading());
  try{
    Todoservice service=Todoservice();
    todolist=await service.gettodoService();
    emit(TodoSuccess(todolist));
  }catch(e){
    emit(TodoFailure());
  }
  }
}