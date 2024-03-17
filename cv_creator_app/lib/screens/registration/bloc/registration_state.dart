part of 'registration_bloc.dart';

@immutable
sealed class RegistrationState {}


final class RegistrationInitial extends RegistrationState {}

class LoadingState extends RegistrationState {}
 
class ShowHidePasswordState extends RegistrationState {
  final bool isHidden;
  ShowHidePasswordState({required this.isHidden});
}

class SignInState extends RegistrationState {}

class SignUpState extends RegistrationState {}

class SuccessState extends RegistrationState {}

class ErrorState extends RegistrationState {
  String message;
  ErrorState({required this.message});
}
