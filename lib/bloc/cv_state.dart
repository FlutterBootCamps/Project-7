part of 'cv_bloc.dart';

@immutable
sealed class CvState {}

final class CvInitial extends CvState {}
final class DisplayState extends CvState {
   List<CV> cvlist;

  DisplayState( this.cvlist);
}