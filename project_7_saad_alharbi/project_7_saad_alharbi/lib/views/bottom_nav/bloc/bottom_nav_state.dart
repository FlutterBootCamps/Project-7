part of 'bottom_nav_bloc.dart';

@immutable
sealed class BottomNavState {}

final class BottomNavInitial extends BottomNavState {}

final class ChangePageState extends BottomNavState {}
