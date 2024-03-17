part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SignupEvent extends AuthEvent{
final String email;
final String password;

SignupEvent({required this.email,required this.password});
}