part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}
final class HomeErrorState extends HomeState {}

final class HomeLoadState extends HomeState {
  final List<ResumeModel> resumesList;
  final ResumeModel resume;
  HomeLoadState({required this.resumesList, required this.resume});
}
