part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class ErrorState extends AuthState{}

class SuccessState extends AuthState{
 
}