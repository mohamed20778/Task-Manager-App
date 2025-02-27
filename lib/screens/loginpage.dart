import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/authcubit/auth_cubit.dart';
import 'package:flutter_application_1/bloc/authcubit/auth_states.dart';
import 'package:flutter_application_1/bloc/authcubit/components/customButton.dart';
import 'package:flutter_application_1/bloc/authcubit/components/customformfield.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/constants/constant.dart';
import 'package:flutter_application_1/models/todoModel.dart';
import 'package:flutter_application_1/screens/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {

   LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TodoModel? todoModel;
  TextEditingController emailController=TextEditingController();

  TextEditingController PasswordController=TextEditingController();
  bool isloading=false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) {
        return AuthCubit();
      },
      child: BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is Authloading) {
          isloading = true;
        } else if (state is AuthSuccess) {
          isloading = false;
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
        } else if (state is Authfailure) {
          isloading = false;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state)=>ModalProgressHUD(
        inAsyncCall: isloading,
        child: Scaffold(
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
                      
                      ourController: emailController,
                      isSecure: false,
                      hintText: 'UserName',
                      firstIcon: Icon(Icons.email_outlined,color: tdBlue,),
                      ourValidator: (value) {
                        return null;
                        
                    },
                    ),SizedBox(height: MediaQuery.of(context).size.width*0.05),
                    CustomformField(
                      ourController: PasswordController,
                      hintText: 'Password',
                      firstIcon: Icon(Icons.lock_outline,color: tdBlue,),
                      lastIcon:Icon(Icons.remove_red_eye_outlined,color: tdBlue,), isSecure: true, ourValidator: (value ) {
                        return null;
                      
          
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width*0.1),
                    Center(child: CustomButton(text: 'Login', onPressed: (){
                    
                      
                    BlocProvider.of<AuthCubit>(context).loginUser(email: emailController.text, password: PasswordController.text);
                                    }))
                
                  ],
                ),
              ),
            ),
          ),
      ), 
         
      ),
    );
  }
}
