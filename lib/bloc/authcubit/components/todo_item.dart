import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/models/todoModel.dart';

class TodoItem extends StatelessWidget {
   TodoItem({super.key,required this.todoModel});
  TodoModel todoModel ;


  @override
  Widget build(BuildContext context) {
    bool isChecked = todoModel.isDone!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(isChecked ? Icons.check_box : Icons.check_box_outline_blank, color: isChecked ? tdBlue : tdGrey),
            ),
            Flexible(child: Text(todoModel.todo!, style: TextStyle(color: tdBlack,overflow: TextOverflow.ellipsis,)),),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: tdRed,
              ),

              child: IconButton(onPressed: () {}, icon: Icon(Icons.delete,color: Colors.white,)),
            ),
          ],
        ),
      ),
    );
  }
}
