part of 'cv_bloc.dart';

@immutable
sealed class CvEvent {}

class FetchEvent extends CvEvent {}

class AddEvent extends CvEvent {
   final CV cv;

  AddEvent(this.cv);
}

class DeletEvent extends CvEvent {
  final int cvId;

 DeletEvent(this.cvId);
}

class EditEvent extends CvEvent {
  final CV cv;

    EditEvent(this.cv);
}