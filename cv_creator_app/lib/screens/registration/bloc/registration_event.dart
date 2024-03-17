part of 'registration_bloc.dart';

@immutable
sealed class RegistrationEvent {}


class ShowHidePasswordEvent extends RegistrationEvent{}

class SignInEvent extends RegistrationEvent{
  String email; 
  String password;
  SignInEvent({required  this.email, required this.password});
}

class SignUpEvent extends RegistrationEvent{
  String name; 
  String email; 
  String password;
  SignUpEvent({required  this.name, required this.email, required this.password});
}

class SignOutEvent extends RegistrationEvent{}
class GetUserNameEvent extends RegistrationEvent{}
