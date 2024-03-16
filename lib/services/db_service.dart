import 'package:cv_maker_app/data_layer/home_data_layer.dart';
import 'package:cv_maker_app/models/education_model.dart';
import 'package:cv_maker_app/models/experience_model.dart';
import 'package:cv_maker_app/models/project_model.dart';
import 'package:cv_maker_app/models/reference_model.dart';
import 'package:cv_maker_app/models/resume_model.dart';
import 'package:cv_maker_app/models/skill_model.dart';
import 'package:cv_maker_app/models/user_info_model.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DBService {
  final supabase = Supabase.instance.client;
  Future<AuthResponse> signup(
      {required String email, required String password}) async {
    AuthResponse res =
        await supabase.auth.signUp(email: email, password: password);

    return res;
  }

  Future<AuthResponse> signin(
      {required String email, required String password}) async {
    AuthResponse res = await supabase.auth
        .signInWithPassword(email: email, password: password);

    return res;
  }

  Future signout() async {
    await supabase.auth.signOut();
  }

  Future insertUser({
    String? name,
    String? jobField,
    String? email,
    String? password,
  }) async {
    await supabase.from('user').insert({
      'name': name,
      'password': password,
      'email': email,
      'job_field': jobField
    });
  }

  Future<String> getUserId({required String token}) async {
    UserResponse userRes = await supabase.auth.getUser(token);
    return userRes.user!.id;
  }

  Future<UserInfo> getCurrentUserInfo() async {
    final locator = GetIt.I.get<HomeData>();
    final list = await supabase
        .from('user')
        .select()
        .match({'id': locator.currentUserId});
    UserInfo userInfo = UserInfo.fromJson(list[0]);
    return userInfo;
  }

  Future createResume(Resume resume) async {
    await supabase.from("Resume").insert(resume.toJson());
  }

  Future<List<Resume>> getAllResumes() async {
    final locator = GetIt.I.get<HomeData>();
    List<Map<String, dynamic>> jsonList = await supabase
        .from("Resume")
        .select()
        .match({"isPublic": true}).neq(
            'userId', await DBService().getUserId(token: locator.token));
    List<Resume> resumeList = List.generate(jsonList.length, (index) {
      return Resume.fromJson(jsonList[index]);
    });
    return resumeList;
  }

  Future<List<Resume>> getUserResumes() async {
    final locator = GetIt.I.get<HomeData>();
    List<Map<String, dynamic>> jsonList = await supabase
        .from("Resume")
        .select()
        .match({'userId': await DBService().getUserId(token: locator.token)});
    List<Resume> resumeList = List.generate(jsonList.length, (index) {
      return Resume.fromJson(jsonList[index]);
    });
    return resumeList;
  }

  Future<Resume> getResumeById({required int id}) async {
    List<Map<String, dynamic>> jsonList =
        await supabase.from("Resume").select().match({"id": id});
    return Resume.fromJson(jsonList[0]);
  }

  Future removeCV({required int id}) async {
    await supabase.from("Resume").delete().match({"id": id});
  }

  Future updatePublicty({required bool isPublic, required int id}) async {
    await supabase
        .from("Resume")
        .update({"isPublic": !isPublic}).match({"id": id});
  }

  Future updatePersonalInfo(
      {required String jobTitle,
      required String phone,
      required String address,
      required int id}) async {
    await supabase.from("Resume").update({
      "job_title": jobTitle,
      "phone": phone,
      "address": address
    }).match({"id": id});
  }
//-------------------------------------------------------------------
  Future addEducation({required Education education}) async {
    await supabase.from("Education").insert(education.toJson());
  }

  Future removeEducation({required Education education,}) async {
    await supabase.from("Education").delete().eq("id", education.id!);
  }

  Future updateEducation({required Education education, required int id}) async {
    await supabase.from("Education").update(education.toJson()).eq("id", id);
  }
//-------------------------------------------------------------------
  Future addExperience({required Experience experience}) async {
    await supabase.from("Experience").insert(experience.toJson());
  }

  Future removeExperience({required Experience experience}) async {
    await supabase.from("Experience").delete().eq("id", experience.id!);
  }

  Future updateExperience({required Experience experience, required int id}) async {
    await supabase.from("Experience").update(experience.toJson()).eq("id", id);
  }
//-------------------------------------------------------------------
  Future addProject({required Project project}) async {
    await supabase.from("Project").insert(project.toJson());
  }

  Future removeProject({required Project project}) async {
    await supabase.from("Project").delete().eq("id", project.id!);
  }

  Future updateProject({required Project project, required int id}) async {
    await supabase.from("Project").update(project.toJson()).eq("id", id);
  }
//-------------------------------------------------------------------
  Future addReference({required Reference reference}) async {
    await supabase.from("Reference").insert(reference.toJson());
  }

  Future removeReference({required Reference reference}) async {
    await supabase.from("Reference").delete().eq("id", reference.id!);
  }

  Future updateReference({required Reference reference, required int id}) async {
    await supabase.from("Reference").update(reference.toJson()).eq("id", id);
  }
//-------------------------------------------------------------------
  Future addSkill({required Skill skill}) async {
    await supabase.from("Skill").insert(skill.toJson());
  }

  Future removeSkill({required Skill skill}) async {
    await supabase.from("Skill").delete().eq("id", skill.id!);
  }

  Future updateSkill({required Skill skill, required int id}) async {
    await supabase.from("Skill").update(skill.toJson()).eq("id", id);
  }
//-------------------------------------------------------------------
  Future<List<Education>> getAllResumeEducation({required int resumeId}) async {
    List<Map<String, dynamic>> jsonList = await supabase
        .from("Education")
        .select()
        .match({'resumeId': resumeId});
    List<Education> educationList = List.generate(jsonList.length, (index) {
      return Education.fromJson(jsonList[index]);
    });
    return educationList;
  }

  Future<List<Experience>> getAllResumeExperience({required int resumeId}) async {
    List<Map<String, dynamic>> jsonList = await supabase
        .from("Experience")
        .select()
        .match({'resumeId': resumeId});
    List<Experience> experienceList = List.generate(jsonList.length, (index) {
      return Experience.fromJson(jsonList[index]);
    });
    return experienceList;
  }

  Future<List<Project>> getAllResumeProject({required int resumeId}) async {
    List<Map<String, dynamic>> jsonList = await supabase
        .from("Project")
        .select()
        .match({'resumeId': resumeId});
    List<Project> projectList = List.generate(jsonList.length, (index) {
      return Project.fromJson(jsonList[index]);
    });
    return projectList;
  }

  Future<List<Reference>> getAllResumeReference({required int resumeId}) async {
    List<Map<String, dynamic>> jsonList = await supabase
        .from("Reference")
        .select()
        .match({'resumeId': resumeId});
    List<Reference> referenceList = List.generate(jsonList.length, (index) {
      return Reference.fromJson(jsonList[index]);
    });
    return referenceList;
  }

  Future<List<Skill>> getAllResumeSkill({required int resumeId}) async {
    List<Map<String, dynamic>> jsonList = await supabase
        .from("Skill")
        .select()
        .match({'resumeId': resumeId});
    List<Skill> skillList = List.generate(jsonList.length, (index) {
      return Skill.fromJson(jsonList[index]);
    });
    return skillList;
  }

  Future<bool> isTokenExpired() async {
    final token = supabase.auth.currentSession?.accessToken;
    if (token != null) {
      return supabase.auth.currentSession!.isExpired;
    }else {
      return true;
    }
    
  }

  Future refreshToken() async {
    await supabase.auth.refreshSession();
  }
}
