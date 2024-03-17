part of 'sign_in_bloc.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}
final class SuccessSignInState extends SignInState{
final String massage;

SuccessSignInState({required this.massage});
}
final class ErrorSignInState extends SignInState{
final String massage;
ErrorSignInState({required this.massage});
}