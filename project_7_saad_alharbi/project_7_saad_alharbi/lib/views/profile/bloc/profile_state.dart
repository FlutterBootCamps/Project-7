part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoadState extends ProfileState {
  final UserInfo user;
  ProfileLoadState({required this.user});
}
