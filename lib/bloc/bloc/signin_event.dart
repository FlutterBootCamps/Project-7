part of 'signin_bloc.dart';

@immutable
sealed class SigninEvent {}

class SignOutEvent extends SigninEvent{}

class SigninnEvent extends SigninEvent{
final String email;
final String password;

SigninnEvent({required this.email,required this.password});
}