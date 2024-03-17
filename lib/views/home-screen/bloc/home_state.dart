part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class SuccessLogOutState extends HomeState{
final String massage;

SuccessLogOutState({required this.massage});
}
final class ErrorLogOutState extends HomeState{
final String massage;
ErrorLogOutState({required this.massage});
}

class LoadingState extends HomeState{

}
