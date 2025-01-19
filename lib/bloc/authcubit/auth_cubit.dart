import 'package:dio/dio.dart';
import 'package:flutter_application_1/bloc/authcubit/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates>{
  
  final Dio dio=Dio();

  AuthCubit():super(AuthInitial());
  Future<void>Login( {required String username, required String password})
  async {
    emit(Authloading());
    try{
      final response=await dio.post('https://dummyjson.com/auth/login',data: {'username':username,'password':password });
      emit(AuthSuccess());
      
    }catch(e){
      emit(Authfailure());
    }
  }
  
}