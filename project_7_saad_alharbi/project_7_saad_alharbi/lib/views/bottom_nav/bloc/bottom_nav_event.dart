part of 'bottom_nav_bloc.dart';

@immutable
sealed class BottomNavEvent {}

final class ChangePageEvent extends BottomNavEvent{
  final int indexPage;
  ChangePageEvent({required this.indexPage});
}
final class LogoutEvent extends BottomNavEvent{}