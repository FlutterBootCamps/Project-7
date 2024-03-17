part of 'previus_cv_bloc.dart';

@immutable
sealed class PreviusCvState {}

final class PreviusCvInitial extends PreviusCvState {}
final class LoadingState extends PreviusCvState {}

final class SuccessState extends PreviusCvState {
  List<CvModel> listResumes;
  SuccessState(this.listResumes);
}
