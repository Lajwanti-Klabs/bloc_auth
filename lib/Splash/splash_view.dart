import 'dart:async';

import 'package:auth_bloc/Home/home_view.dart';
import 'package:auth_bloc/Login/login_view.dart';
import 'package:auth_bloc/Model/user_token.dart';
import 'package:auth_bloc/shared_prefernce.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

 checkAuth(BuildContext context)async{

     getUserToken().then((value){
       print(value.token.toString());
       if(value.token=="null" || value.token ==""){
         Future.delayed(const Duration(seconds: 5),(){
           Navigator.pop(context);
           Navigator.push(context, MaterialPageRoute(builder: (_)=>const LoginView()));

         });

       }
       else{
         Future.delayed(const Duration(seconds: 5),(){
           Navigator.pop(context);
           Navigator.push(context, MaterialPageRoute(builder: (_)=>const HomeView()));

         });

       }
     });


  }


  @override
  void initState() {
    super.initState();
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    // getToken();
    //
    // });


    checkAuth(context);

      }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Splash View",style: TextStyle(color: Colors.black,fontSize: 20),),
      ),
    );
  }
}
