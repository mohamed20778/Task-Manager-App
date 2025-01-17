import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';

class CustomformField extends StatelessWidget {
  String? Function(String?)? ourValidator;
  String? hintText;
  Icon? firstIcon;
  Icon? lastIcon;
  bool isSecure=false;
  TextEditingController? ourController;

   CustomformField({super.key,required this.hintText,required this.firstIcon,this.lastIcon,required this.isSecure,this.ourController,});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // validator:ourValidator,
      controller: ourController,
      obscureText: isSecure,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide:  BorderSide(color:tdBlue,width:2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide:  BorderSide(color:tdBlue,width:2),
        ),

        border: OutlineInputBorder(

          borderRadius: BorderRadius.circular(15)
        ),

        prefixIcon: firstIcon,
        suffixIcon: lastIcon,
        hintText: hintText,
        hintStyle: TextStyle(
          color: tdGrey,
          fontSize: 15
        ),
      ),
    );
  }
}
