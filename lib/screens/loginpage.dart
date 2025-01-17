import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/customButton.dart';
import 'package:flutter_application_1/components/customformfield.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/constants/constant.dart';

class LoginPage extends StatelessWidget {
  TextEditingController userNameController=TextEditingController();
  TextEditingController PasswordController=TextEditingController();
   LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.width*0.5),
              Center(
                child: Text('Task Manager App',style: TextStyle(
                  color: tdBlue,
                  fontSize: 40,
          
                  fontFamily: titleFont,
                ),),
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.8),
              CustomformField(
                ourController: userNameController,
                isSecure: false,
                hintText: 'UserName',
                firstIcon: Icon(Icons.email_outlined,color: tdBlue,),
              //   ourValidator: (value) {
              //     if
              // },
              ),SizedBox(height: MediaQuery.of(context).size.width*0.05),
              CustomformField(
                ourController: PasswordController,
                hintText: 'Password',
                firstIcon: Icon(Icons.lock_outline,color: tdBlue,),
                lastIcon:Icon(Icons.remove_red_eye_outlined,color: tdBlue,), isSecure: true,
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.1),
              Center(child: CustomButton(text: 'Login', onPressed: (){}))
          
            ],
          ),
        ),
      ),
    );
  }
}
