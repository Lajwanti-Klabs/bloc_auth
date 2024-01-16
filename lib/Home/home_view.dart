import 'package:auth_bloc/Login/login_view.dart';
import 'package:auth_bloc/shared_prefernce.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Home View"),
      ),
      body: GestureDetector(
        onTap: (){
          removeToken();
          // Navigator.pop(context);
          // Navigator.push(context, MaterialPageRoute(builder: (_)=>const LoginView()));
        },
        child: const Center(
          child: Text("Logout"),
        ),
      ),
    );
  }
}
