part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {}
class SignInEventEvent extends SignInEvent{
  final String email;
  final String password;
  SignInEventEvent( {required this.email, required this.password});
}