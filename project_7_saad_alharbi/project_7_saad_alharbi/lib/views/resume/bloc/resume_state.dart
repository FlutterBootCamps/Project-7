part of 'resume_bloc.dart';

@immutable
sealed class ResumeState {}

final class ResumeInitial extends ResumeState {}

final class ResumeLoadingState extends ResumeState {}

final class ResumeSuccessState extends ResumeState {
  final String msg;
  ResumeSuccessState({required this.msg});
}

final class ResumeErrorState extends ResumeState {
  final String msg;
  ResumeErrorState({required this.msg});
}
