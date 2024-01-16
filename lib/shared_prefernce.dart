import 'package:auth_bloc/Model/user_token.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';



final Future<SharedPreferences> sp = SharedPreferences.getInstance();

// Future<UserModelToken> getToken()async{
//   final SharedPreferences preferences = await sp;
//   String? getUserToken = preferences.getString('token');
//   debugPrint("Get token::$getUserToken");
//   return UserModelToken(token:getUserToken);
// }
Future<UserModelToken> getUserToken()async{
  final SharedPreferences sp = await SharedPreferences.getInstance();
  final String? getToken = await sp.getString('token');
  debugPrint("get token:: $getToken");
  print(UserModelToken(
    token: getToken.toString(),
  ));

  return UserModelToken(
    token: getToken.toString(),
  );
}

Future<bool> setToken(UserModelToken userToken)async{
  final SharedPreferences preferences = await sp;
  await preferences.setString("token", userToken.token.toString());
  debugPrint("set token:: ${await preferences.setString('token',userToken.token.toString())}");

  return true;
}

Future<bool> removeToken()async{
  final SharedPreferences preferences = await sp;
  preferences.remove('token');
  print("Token remove::");
  return true;
}