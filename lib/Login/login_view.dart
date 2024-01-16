import 'package:auth_bloc/Bloc/login_event.dart';
import 'package:auth_bloc/Home/home_view.dart';
import 'package:auth_bloc/Model/user_token.dart';
import 'package:auth_bloc/shared_prefernce.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Bloc/login_bloc.dart';
import '../Bloc/login_state.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Dio dio = Dio();

  //eve.holt@reqres.in
//cityslicka
  void userLogin(dynamic data) async {
    Response response = await dio.post(
        "https://reqres.in/api/login", data: data);
    debugPrint(response.data['token']);
    try {
      if (response.statusCode == 200) {
        setToken(UserModelToken(token: response.data['token']));
        debugPrint("User Login");
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const HomeView()));
      }
    } on DioException catch (e) {
      print("Error : ${e.error}");
      // print("Message : ${e.message}");
      // print("Response : ${e.response}");
      // print("ErrorType : ${e.type}");

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,

              ),
              const SizedBox(height: 30,),
              TextField(
                controller: passController,
              ),
              const SizedBox(height: 30,),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return
                  ElevatedButton(onPressed: () {
                    Map data = {
                      "email": emailController.text,
                      "password": passController.text,
                    };
                    context.read<LoginBloc>().add(LoggedInEvent(data: data,context: context));
                    //userLogin(data);
                  }, child: const Text("Login"));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
