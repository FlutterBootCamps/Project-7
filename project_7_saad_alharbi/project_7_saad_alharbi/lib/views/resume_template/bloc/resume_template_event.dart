part of 'resume_template_bloc.dart';

@immutable
sealed class ResumeTemplateEvent {}

class ResumeTemplateUpdateEvent extends ResumeTemplateEvent {
  final ResumeModel resume;
  ResumeTemplateUpdateEvent({required this.resume});
}



class ResumeTemplateDeleteEvent extends ResumeTemplateEvent {}

class ResumeTemplatePublishedEvent extends ResumeTemplateEvent {
  bool isPublished ;
  ResumeTemplatePublishedEvent({required this.isPublished});
}
