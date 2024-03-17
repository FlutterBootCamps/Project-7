part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

final class SignUpNewUserEvent extends SignUpEvent {
  final String name;
  final String email;
  final String password;
  SignUpNewUserEvent({required this.email, required this.password, required this.name});
}
