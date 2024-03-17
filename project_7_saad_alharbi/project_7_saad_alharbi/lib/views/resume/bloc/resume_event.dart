part of 'resume_bloc.dart';

@immutable
sealed class ResumeEvent {}

class CreateCVEvent extends ResumeEvent{
 final ResumeModel resume;
  CreateCVEvent({required this.resume});
}