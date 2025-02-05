import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/bloc/authcubit/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates>{
  
  final Dio dio=Dio();

  AuthCubit():super(AuthInitial());
 Future<void> loginUser(
      {required String email, required String password}) async {
    emit(Authloading());
    try {
      var auth = FirebaseAuth.instance;
      UserCredential user = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (user.user != null) {
        emit(AuthSuccess());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(Authfailure(errMessage: 'user-not-found'));
      } else if (e.code == 'wrong-password') {
        emit(Authfailure(errMessage: 'wrong-password'));
      }
    }catch(e){
      emit(Authfailure(errMessage: 'something went wrong'));
    }
  }
  }