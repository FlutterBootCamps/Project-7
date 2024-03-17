part of 'log_in_bloc.dart';

@immutable
sealed class LogInEvent {}
class LogInEventEvent extends LogInEvent{
  final String email;
  final String password;
  LogInEventEvent( {required this.email, required this.password});
}

