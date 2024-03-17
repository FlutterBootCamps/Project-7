part of 'view_cv_bloc.dart';

@immutable
sealed class ViewCvEvent {}

class FachDataEvent extends ViewCvEvent {}
class DeleteCvEvent  extends ViewCvEvent{}
class LogOutCvEvent  extends ViewCvEvent{}