import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:project_7_saad_alharbi/model/resume_model.dart';
import 'package:project_7_saad_alharbi/service/supabase_services.dart';

part 'resume_template_event.dart';
part 'resume_template_state.dart';

class ResumeTemplateBloc
    extends Bloc<ResumeTemplateEvent, ResumeTemplateState> {
  bool isPublished = false;
  TextEditingController nameControllerUpdated = TextEditingController();
  TextEditingController emailControllerUpdated = TextEditingController();
  TextEditingController phoneControllerUpdated = TextEditingController();
  TextEditingController addressControllerUpdated = TextEditingController();
  TextEditingController jobControllerUpdated = TextEditingController();
  TextEditingController aboutMeControllerUpdated = TextEditingController();
  TextEditingController educationControllerUpdated = TextEditingController();
  TextEditingController experienceControllerUpdated = TextEditingController();
  TextEditingController skillsControllerUpdated = TextEditingController();
  TextEditingController projectsControllerUpdated = TextEditingController();
  TextEditingController referencesControllerUpdated = TextEditingController();

  ResumeTemplateBloc() : super(ResumeTemplateInitial()) {
    on<ResumeTemplateEvent>((event, emit) {});
    on<ResumeTemplateUpdateEvent>(methodUpdateResume);
    on<ResumeTemplateDeleteEvent>(methodDeleteResume);
    on<ResumeTemplatePublishedEvent>(methodPublishedResume);
  }

  FutureOr<void> methodUpdateResume(ResumeTemplateUpdateEvent event,
      Emitter<ResumeTemplateState> emit) async {
    emit(ResumeTemplateLoadingState());
    if (nameControllerUpdated.text.trim().isNotEmpty &&
        emailControllerUpdated.text.trim().isNotEmpty &&
        phoneControllerUpdated.text.trim().isNotEmpty &&
        aboutMeControllerUpdated.text.trim().isNotEmpty &&
        addressControllerUpdated.text.trim().isNotEmpty &&
        educationControllerUpdated.text.trim().isNotEmpty &&
        experienceControllerUpdated.text.trim().isNotEmpty &&
        jobControllerUpdated.text.trim().isNotEmpty &&
        projectsControllerUpdated.text.trim().isNotEmpty &&
        referencesControllerUpdated.text.trim().isNotEmpty &&
        skillsControllerUpdated.text.trim().isNotEmpty) {
      try {
        await DBService().updateResume(resume: event.resume);
        emit(ResumeTemplateSuccessState(msg: "Resume updated Successfully."));
      } catch (e) {
        emit(ResumeTemplateErrorState(msg: "Error"));
      }
    } else {
      emit(ResumeTemplateErrorState(msg: "Fill the require felid"));
    }
  }

  FutureOr<void> methodDeleteResume(ResumeTemplateDeleteEvent event,
      Emitter<ResumeTemplateState> emit) async {
    try {
      await DBService().deleteResume();
      emit(ResumeTemplateSuccessState(msg: "Resume deleted Successfully."));
    } catch (e) {
      emit(ResumeTemplateErrorState(msg: "Error"));
    }
  }

  FutureOr<void> methodPublishedResume(ResumeTemplatePublishedEvent event,
      Emitter<ResumeTemplateState> emit) async {
    isPublished = !isPublished;
    try {
      await DBService().updatePublished(isPublished);
      emit(ResumeTemplateSuccessState(msg: "Published"));
    } catch (e) {
      emit(ResumeTemplateErrorState(msg: "unPublished"));
    }
  }
}
