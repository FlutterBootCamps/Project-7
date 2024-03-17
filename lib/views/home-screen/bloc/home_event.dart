part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}
class LogOutEvent extends HomeEvent {}
class InsertRowEvent extends HomeEvent{
 final String name;
  final String summary;
  final String education;
  final String experience;
  final String skills;
  final String languages;

  InsertRowEvent( {required this.name,required this.summary,required this.education, required this.experience, required this.skills, required this.languages});
}

