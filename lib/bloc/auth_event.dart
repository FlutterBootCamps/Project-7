part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class SignupEvent extends AuthEvent {
  final String name;
  final String jobField;
  final String email;
  final String password;

  SignupEvent({required this.name, required this.jobField,required this.email, required this.password});
}

final class SigninEvent extends AuthEvent {
  final String email;
  final String password;

  SigninEvent({required this.email, required this.password});
}

final class SignoutEvent extends AuthEvent {
  
}


final class ViewUserInfoEvent extends AuthEvent {
  
}