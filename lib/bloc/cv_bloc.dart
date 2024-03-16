import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cv_maker_app/models/education_model.dart';
import 'package:cv_maker_app/models/experience_model.dart';
import 'package:cv_maker_app/models/project_model.dart';
import 'package:cv_maker_app/models/reference_model.dart';
import 'package:cv_maker_app/models/resume_model.dart';
import 'package:cv_maker_app/models/skill_model.dart';
import 'package:cv_maker_app/services/db_service.dart';
import 'package:meta/meta.dart';

part 'cv_event.dart';
part 'cv_state.dart';

class CvBloc extends Bloc<CvEvent, CvState> {
  CvBloc() : super(CvInitial()) {

    on<CreateResumeEvent>(createResume);
    on<GetAllResumesEvent>(getAllResumes);
    on<GetUserResumesEvent>(getUserResumes);
    on<GetResumeByIdEvent>(getResumeById);
    on<RemoveResumeEvent>(removeResume);
    on<UpdatePublicityEvent>(updatePublicity);
    on<UpdatePersonalInfoEvent>(updatePersonalInfo);
    on<AddEducationEvent>(addEducation);
    on<RemoveEducationEvent>(removeEducation);
    on<UpdateEducationEvent>(updateEducation);
  }

  FutureOr<void> createResume(CreateResumeEvent event, Emitter<CvState> emit) async{
    emit(CvLoadingState());
    
    if(event.resume.cvName.trim().isNotEmpty && event.resume.jobTitle.trim().isNotEmpty && event.resume.phone.trim().isNotEmpty && event.resume.address.trim().isNotEmpty){
      try {
        await DBService().createResume(event.resume);
        emit(ResumeCreatedState(msg: "${event.resume.cvName} CV has been created"));
      } catch (e) {
        emit(CvErrorState(msg: "There's a problem with our services, please try again later..."));
      }
    }else {
      emit(CvErrorState(msg: "Please fill out all fields"));
    }
  }

  FutureOr<void> getAllResumes(GetAllResumesEvent event, Emitter<CvState> emit) async{
    emit(CvLoadingState());

    try {
      List<Resume> resumeList = await DBService().getAllResumes();
      emit(ShowAllResumesState(resumeList: resumeList));
    } catch (e) {
      print(e);
      emit(CvErrorState(msg: "Error in getting all CV's"));
    }
  }

  FutureOr<void> getUserResumes(GetUserResumesEvent event, Emitter<CvState> emit) async{
    emit(CvLoadingState());

    try {
      List<Resume> resumeList = await DBService().getUserResumes();
      emit(ShowUserResumesState(resumeList: resumeList));
    } catch (e) {
      print(e);
      emit(CvErrorState(msg: "Error in getting all CV's"));
    }
  }

  FutureOr<void> getResumeById(GetResumeByIdEvent event, Emitter<CvState> emit) async{
    emit(CvLoadingState());
    try {
      Resume resume = await DBService().getResumeById(id: event.id);
      List<Education> educationList = await DBService().getAllResumeEducation(resumeId: resume.id!);
      List<Experience> experienceList = await DBService().getAllResumeExperience(resumeId: resume.id!);
      List<Project> projectList = await DBService().getAllResumeProject(resumeId: resume.id!);
      List<Reference> referenceList = await DBService().getAllResumeReference(resumeId: resume.id!);
      List<Skill> skillList = await DBService().getAllResumeSkill(resumeId: resume.id!);

      emit(ShowOneResumeState(resume: resume, educationList: educationList, experienceList: experienceList, projectList: projectList, referenceList: referenceList, skillList: skillList));
    }catch (e) {
      emit(CvErrorState(msg: "Error in getting CV info"));
    }
  }

  FutureOr<void> removeResume(RemoveResumeEvent event, Emitter<CvState> emit) async{
    try {
      await DBService().removeCV(id: event.id);
      emit(ModfiedResumeState(msg: "This CV has been removed.", isPostive: false));
      
      await getUserResumes(GetUserResumesEvent(), emit);
    } catch (e) {
      emit(CvErrorState(msg: "Error in deleting this CV"));
    }
  }

  FutureOr<void> updatePublicity(UpdatePublicityEvent event, Emitter<CvState> emit) async{
    try {
      await DBService().updatePublicty(isPublic: event.isPublic, id: event.id);
      emit(ModfiedResumeState(msg: "This CV is now ${event.isPublic ? "private" : "public"}", isPostive: !event.isPublic));

      await getResumeById(GetResumeByIdEvent(id: event.id), emit);
    }catch (e) {
      emit(CvErrorState(msg: "Error in changing this CV's publicty status"));
    }
  }

  FutureOr<void> updatePersonalInfo(UpdatePersonalInfoEvent event, Emitter<CvState> emit) async{
    if (event.address.trim().isNotEmpty && event.jobTitle.trim().isNotEmpty && event.phone.trim().isNotEmpty){
      try {
      await DBService().updatePersonalInfo(jobTitle: event.jobTitle, phone: event.phone, address: event.address, id: event.id);
      emit(ModfiedResumeState(msg: "Personal info has been updated", isPostive: true));

      await getResumeById(GetResumeByIdEvent(id: event.id), emit);
    } catch (e) {
      emit(CvErrorState(msg: "Error in modfying this cv's personal info."));
    }
    }else {
      emit(CvErrorState(msg: "please fill all fields."));
    }
  }

  FutureOr<void> addEducation(AddEducationEvent event, Emitter<CvState> emit) async{
    emit(CvLoadingState());

    if(event.education.degree.trim().isNotEmpty && event.education.school.trim().isNotEmpty && event.education.country.trim().isNotEmpty && event.education.city.trim().isNotEmpty && event.education.startDate != null && event.education.endDate != null){
      if (event.education.startDate!.isAfter(event.education.endDate!)){
        emit(CvErrorState(msg: "Start date can't be after end date!"));
      }else {
        try {
        await DBService().addEducation(education: event.education);
        emit(ModfiedResumeState(msg: "Education added successfuly", isPostive: true));

        await getResumeById(GetResumeByIdEvent(id: event.education.resumeId), emit);
      } catch (e) {
        print(e);
        emit(CvErrorState(msg: "Error in adding this education"));
      }
      }
    }else {
      emit(CvErrorState(msg: "Please fill out all fields, and pick all dates."));
    }
  }

  FutureOr<void> removeEducation(RemoveEducationEvent event, Emitter<CvState> emit) async{
    emit(CvLoadingState());

    try {
      await DBService().removeEducation(education: event.education);
      emit(ModfiedResumeState(msg: "This Education has been removed.", isPostive: false));
      
      await getResumeById(GetResumeByIdEvent(id: event.education.resumeId), emit);
    } catch (e) {
      emit(CvErrorState(msg: "Error in deleting this Education"));
    }
  }

  FutureOr<void> updateEducation(UpdateEducationEvent event, Emitter<CvState> emit) async{
    if (event.education.degree.trim().isNotEmpty && event.education.school.trim().isNotEmpty && event.education.country.trim().isNotEmpty && event.education.city.trim().isNotEmpty && event.education.startDate != null && event.education.endDate != null){
      if(event.education.startDate!.isAfter(event.education.endDate!)){
        emit(CvErrorState(msg: "Start date can't be after end date!"));
      }else {
        try {
      await DBService().updateEducation(education: event.education, id: event.id);
      emit(ModfiedResumeState(msg: "This education has been updated", isPostive: true));

      await getResumeById(GetResumeByIdEvent(id: event.education.resumeId), emit);
    } catch (e) {
      emit(CvErrorState(msg: "Error in modfying this education's details."));
    }
      }
    }else {
      emit(CvErrorState(msg: "please fill all fields, and pick all dates"));
    }
  }
}
