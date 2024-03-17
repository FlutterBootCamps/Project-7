part of 'resume_template_bloc.dart';

@immutable
sealed class ResumeTemplateState {}

final class ResumeTemplateInitial extends ResumeTemplateState {}

final class ResumeTemplateLoadingState extends ResumeTemplateState {}


final class ResumeTemplateSuccessState extends ResumeTemplateState {
  final String msg;
  ResumeTemplateSuccessState({required this.msg});
}

final class ResumeTemplateErrorState extends ResumeTemplateState {
  final String msg;
  ResumeTemplateErrorState({required this.msg});
}
