import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.check_box, color: tdBlue),
            ),
            Text('going to visit famdsasasdsdsdsily', style: TextStyle(color: tdBlack)),
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
