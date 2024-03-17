part of 'cv_bloc.dart';

@immutable
sealed class CvEvent {}

class FetchCVsEvent extends CvEvent {}

class GetUserCVEvent extends CvEvent {}

class AddNewCVEvent extends CvEvent {
  CVModel cv;
  AddNewCVEvent({required this.cv});
}

class UpdateCVEvent extends CvEvent {
  CVModel cv;
  UpdateCVEvent({required this.cv});
}

class DeleteCVEvent extends CvEvent {}
