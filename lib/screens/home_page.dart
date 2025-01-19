import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/authcubit/auth_cubit.dart';
import 'package:flutter_application_1/bloc/todoCubit/todo_State.dart';
import 'package:flutter_application_1/bloc/todoCubit/todo_cubit.dart';
import 'package:flutter_application_1/bloc/authcubit/components/search_box.dart';
import 'package:flutter_application_1/bloc/authcubit/components/todo_item.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/models/todoModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TodoModel> todoList = [];
  @override
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TodoCubit>(context).getTodos();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      
      drawer: Drawer(
        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween  ,
        children: [
          SizedBox(
            height: 200,
            width: 400,
            child: DrawerHeader(
              decoration: BoxDecoration(color: tdBlue),
              child: Center (
                child: Text(
                  'Settings',
                  style: TextStyle(
                      color: tdBGColor, fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              // BlocProvider.of<AuthCubit>(context).logout(context);
            },
          ),
        ],
      )),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Our ToDos',
          style: TextStyle(
              color: tdBlack, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<TodoCubit, TodoState>(builder: (context, state) {
        if (state is TodoLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TodoSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SearchBox(),
              SizedBox(height: MediaQuery.of(context).size.width * 0.1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'All ToDos',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9),
                  child: ListView.builder(
                    itemCount: state.todolist!.length,
                    itemBuilder: (context, index) {
                      return TodoItem(
                        todoModel: state.todolist![index],
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        } else if (state is TodoFailure) {
          return Center(
            child: Text('Something went wrong'),
          );
        } else {
          return Center(
            child: Text('check model'),
          );
        }
      }),
    );
  }
}
