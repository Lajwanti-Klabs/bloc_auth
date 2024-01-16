// ignore_for_file: use_build_context_synchronously

import 'package:auth_bloc/Bloc/login_event.dart';
import 'package:auth_bloc/Bloc/login_state.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Home/home_view.dart';
import '../Model/user_token.dart';
import '../shared_prefernce.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  final Dio _dio = Dio();
  LoginBloc() : super(const LoginState()){
    on<LoggedInEvent>(_userLogin);
  }


  Future<void> _userLogin(LoggedInEvent event, Emitter<LoginState> emit) async {
    Response response = await _dio.post("https://reqres.in/api/login",data: event.data);
    debugPrint(response.data['token']);
    try{
      if(response.statusCode == 200){
        setToken(UserModelToken(token: response.data['token']));
        debugPrint("User Login");

        Navigator.pop(event.context);

        Navigator.push(event.context, MaterialPageRoute(builder: (_)=> HomeView()));
      }

    }on DioException catch(e){
      print("Error : ${e.error}");
      // print("Message : ${e.message}");
      // print("Response : ${e.response}");
      // print("ErrorType : ${e.type}");

    }
  }


}