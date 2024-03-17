part of 'view_cv_bloc.dart';

@immutable
sealed class ViewCvState {}

final class ViewCvInitial extends ViewCvState {}
class DisplayInfoState extends ViewCvState{
   List<CV>classCv = [];
  DisplayInfoState({required this.classCv});
}
class LoadingState extends ViewCvState{

}
