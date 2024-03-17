part of 'log_in_bloc.dart';

@immutable
sealed class LogInState {}

final class LogInInitial extends LogInState {}
final class SuccessState extends LogInState{
final String massage;

SuccessState({required this.massage});
}
final class ErrorState extends LogInState{
final String massage;
ErrorState({required this.massage});
}

