part of 'cv_bloc.dart';

@immutable
sealed class CvState {}

final class CvInitial extends CvState {}

final class ResumeCreatedState extends CvState {
  final String msg;

  ResumeCreatedState({required this.msg});
}

final class CvErrorState extends CvState {
  final String msg;

  CvErrorState({required this.msg});
}

final class CvLoadingState extends CvState {

}

final class ShowUserResumesState extends CvState {
  final List<Resume> resumeList;

  ShowUserResumesState({required this.resumeList});
}

final class ShowAllResumesState extends CvState {
  final List<Resume> resumeList;

  ShowAllResumesState({required this.resumeList});
}

final class ShowOneResumeState extends CvState {
  final Resume resume;
  final List<Education> educationList;
  final List<Experience> experienceList;
  final List<Project> projectList;
  final List<Reference> referenceList;
  final List<Skill> skillList;

  ShowOneResumeState({required this.resume, required this.educationList, required this.experienceList, required this.projectList, required this.referenceList, required this.skillList});
}

final class ModfiedResumeState extends CvState {
  final String msg;
  final bool isPostive;
  
  ModfiedResumeState({required this.msg, required this.isPostive});
}