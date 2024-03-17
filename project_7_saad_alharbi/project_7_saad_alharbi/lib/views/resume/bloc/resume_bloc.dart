import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:project_7_saad_alharbi/model/resume_model.dart';
import 'package:project_7_saad_alharbi/service/supabase_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'resume_event.dart';
part 'resume_state.dart';

class ResumeBloc extends Bloc<ResumeEvent, ResumeState> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController aboutMeController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController skillsController = TextEditingController();
  TextEditingController projectsController = TextEditingController();
  TextEditingController referencesController = TextEditingController();

  ResumeBloc() : super(ResumeInitial()) {
    on<ResumeEvent>((event, emit) {});
    on<CreateCVEvent>(methodCreateCV);
  }

  FutureOr<void> methodCreateCV(
      CreateCVEvent event, Emitter<ResumeState> emit) async {
    emit(ResumeLoadingState());
    if (nameController.text.trim().isNotEmpty &&
        emailController.text.trim().isNotEmpty &&
        phoneController.text.trim().isNotEmpty &&
        aboutMeController.text.trim().isNotEmpty &&
        addressController.text.trim().isNotEmpty &&
        educationController.text.trim().isNotEmpty &&
        experienceController.text.trim().isNotEmpty &&
        jobController.text.trim().isNotEmpty &&
        projectsController.text.trim().isNotEmpty &&
        referencesController.text.trim().isNotEmpty &&
        skillsController.text.trim().isNotEmpty) {
      try {
        await DBService().createResume(resume: event.resume);
        emit(ResumeSuccessState(msg: "Resume add Successfully."));
      } on PostgrestException catch (e) {
        emit(ResumeErrorState(msg: "User already have a Resume "));
      } catch (e) {
        emit(ResumeErrorState(msg: "Error"));
      }
    } else {
      emit(ResumeErrorState(msg: "Fill the require felid"));
    }
  }
}
