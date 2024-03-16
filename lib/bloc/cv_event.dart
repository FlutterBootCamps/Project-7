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