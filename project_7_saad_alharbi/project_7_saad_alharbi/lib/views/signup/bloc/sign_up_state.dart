part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccessState extends SignUpState {
  final String msg;
  SignUpSuccessState({required this.msg});
}

final class SignUpErrorState extends SignUpState {
  final String msg;
  SignUpErrorState({required this.msg});
}
