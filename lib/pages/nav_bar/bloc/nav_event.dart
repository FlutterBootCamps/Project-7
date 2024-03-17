part of 'nav_bloc.dart';

@immutable
sealed class NavEvent {}
final class ChangeThePageEvent extends NavEvent{
    late int currentIndex;

  ChangeThePageEvent({required this.currentIndex});
}