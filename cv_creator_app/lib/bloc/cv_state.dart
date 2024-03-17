part of 'cv_bloc.dart';

@immutable
sealed class CvState {}

final class CvInitial extends CvState {}

class SuccessCVState extends CvState {}

class SuccessAddCVState extends CvState {}

class SuccessUpdateCVState extends CvState {}

class LoadingCVState extends CvState {}

class DisplayCVState extends CvState {
  List<CVModel> cvs;
  DisplayCVState({required this.cvs});
}

class DisplayUserCVState extends CvState {
  List<CVModel> userCV;
  DisplayUserCVState({required this.userCV});
}

class AddCVState extends CvState {}

class ErrorState extends CvState {}
