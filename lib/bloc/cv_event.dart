part of 'cv_bloc.dart';

@immutable
sealed class CvEvent {}

final class CreateResumeEvent extends CvEvent {
  final Resume resume;

  CreateResumeEvent({required this.resume});
}

final class GetUserResumesEvent extends CvEvent {
  
}

final class GetAllResumesEvent extends CvEvent {

}

final class GetResumeByIdEvent extends CvEvent {
  final int id;

  GetResumeByIdEvent({required this.id});
}

final class RemoveResumeEvent extends CvEvent {
  final int id;

  RemoveResumeEvent({required this.id});
}

final class UpdatePublicityEvent extends CvEvent {
  final int id;
  final bool isPublic;

  UpdatePublicityEvent({required this.id, required this.isPublic});
}

final class UpdatePersonalInfoEvent extends CvEvent {
  final int id;
  final String jobTitle;
  final String phone;
  final String address;

  UpdatePersonalInfoEvent({required this.id, required this.jobTitle, required this.phone, required this.address});
}

//-------------------------------------------------------------------
final class AddEducationEvent extends CvEvent {
  final Education education;

  AddEducationEvent({required this.education,});
}

final class RemoveEducationEvent extends CvEvent {
  final Education education;

  RemoveEducationEvent({required this.education});
}

final class UpdateEducationEvent extends CvEvent {
  final int id;
  final Education education;

  UpdateEducationEvent({required this.id, required this.education});
}
//-------------------------------------------------------------------
final class AddExperienceEvent extends CvEvent {
  final Experience experience;

  AddExperienceEvent({required this.experience,});
}

final class RemoveExperienceEvent extends CvEvent {
  final Experience experience;

  RemoveExperienceEvent({required this.experience});
}

final class UpdateExperienceEvent extends CvEvent {
  final int id;
  final Experience experience;

  UpdateExperienceEvent({required this.id, required this.experience});
}
//-------------------------------------------------------------------
final class AddProjectEvent extends CvEvent {
  final Project project;

  AddProjectEvent({required this.project,});
}

final class RemoveProjectEvent extends CvEvent {
  final Project project;

  RemoveProjectEvent({required this.project});
}

final class UpdateProjectEvent extends CvEvent {
  final int id;
  final Project project;

  UpdateProjectEvent({required this.id, required this.project});
}
//-------------------------------------------------------------------
final class AddSkillEvent extends CvEvent {
  final Skill skill;

  AddSkillEvent({required this.skill,});
}

final class RemoveSkillEvent extends CvEvent {
  final Skill skill;

  RemoveSkillEvent({required this.skill});
}

final class UpdateSkillEvent extends CvEvent {
  final int id;
  final Skill skill;

  UpdateSkillEvent({required this.id, required this.skill});
}
//-------------------------------------------------------------------
final class AddReferenceEvent extends CvEvent {
  final Reference reference;

  AddReferenceEvent({required this.reference,});
}

final class RemoveReferenceEvent extends CvEvent {
  final Reference reference;

  RemoveReferenceEvent({required this.reference});
}

final class UpdateReferenceEvent extends CvEvent {
  final int id;
  final Reference reference;

  UpdateReferenceEvent({required this.id, required this.reference});
  
}
//-------------------------------------------------------------------