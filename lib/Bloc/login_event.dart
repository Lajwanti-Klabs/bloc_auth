import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginEvent extends Equatable {

 const LoginEvent();
 @override
 List<Object?> get props =>[];
}

class LoggedInEvent extends LoginEvent{
  final dynamic data;
  final BuildContext context;
   const LoggedInEvent({required this.data,required this.context});
  @override
  List<Object?> get props =>[data,context];


}
