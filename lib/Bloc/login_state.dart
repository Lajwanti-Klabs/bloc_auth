import 'package:equatable/equatable.dart';

class LoginState extends Equatable{
  const LoginState();
  @override
  List<Object> get  props => [];
}

class LoginLoading extends LoginState{}
class LoginErrorState extends LoginState{}

