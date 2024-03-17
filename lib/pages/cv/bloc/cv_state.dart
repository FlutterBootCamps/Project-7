part of 'cv_bloc.dart';

@immutable
sealed class CvState {}

final class CvInitial extends CvState {}

final class LoadingState extends CvState {}

final class SuccessState extends CvState {
  List<CvModel> listResumes;
  SuccessState(this.listResumes);
}
