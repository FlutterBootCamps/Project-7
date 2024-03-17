part of 'edit_bloc.dart';

@immutable
sealed class EditState {}

final class EditInitial extends EditState {}
class DisplayEditState extends EditState{
   List<CV>classCv = [];
  DisplayEditState({required this.classCv});
}