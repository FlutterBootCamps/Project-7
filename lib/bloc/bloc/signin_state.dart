part of 'signin_bloc.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}

class ErrorState extends SigninState{
   final String wrongSignIn;
  ErrorState({required this.wrongSignIn,});
}

class SignInSuccessState extends SigninState{
}
class SignOutSuccessState extends SigninState{
}

