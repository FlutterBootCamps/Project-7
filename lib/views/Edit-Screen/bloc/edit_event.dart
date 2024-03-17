part of 'edit_bloc.dart';

@immutable
sealed class EditEvent {}
class EditDataEvent extends EditEvent {
  final String name;
  final String summary;
  final String education;
  final String experience;
  final String skills;
  final String languages;

  EditDataEvent( {required this.name,required this.summary,required this.education, required this.experience, required this.skills, required this.languages});
}
