import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/constants/constant.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed ;
  const CustomButton({super.key , required this.text , required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 338 , 
      child: ElevatedButton(
        
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor:
              WidgetStateProperty.all(tdBlue),
          padding: WidgetStateProperty.all(
              EdgeInsets.symmetric(horizontal: 0, vertical: 15)),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
            
              borderRadius: BorderRadius.circular(16))),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 20, color: Color(0xffFFFFFF) , fontFamily: titleFont),
        ),
      ),
    );
  }
}