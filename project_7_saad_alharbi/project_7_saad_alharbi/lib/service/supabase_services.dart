import 'package:project_7_saad_alharbi/model/resume_model.dart';
import 'package:project_7_saad_alharbi/model/user_info_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DBService {
  final supabase = Supabase.instance.client;

  //Sign up
  Future signUp({required String email, required String password}) async {
    await supabase.auth.signUp(password: password, email: email);
  }

  //Login
  Future login({required String email, required password}) async {
    final respone = await supabase.auth
        .signInWithPassword(password: password, email: email);
    return respone.user!.id;
  }

  //Logout
  Future logOut() async {
    await supabase.auth.signOut();
  }

  //create user
  Future createUser({
    required String? name,
    required String? email,
  }) async {
    await supabase.from('userinfo').insert({
      'name': name,
      'email': email,
    });
  }

  //get User
  Future<UserInfo> getUser() async {
    final userData = await supabase
        .from('userinfo')
        .select('*')
        .match({'id': supabase.auth.currentUser!.id}).single();

    return UserInfo.fromJson(userData);
  }

  //create Resume
  Future createResume({required ResumeModel resume}) async {
    await supabase.from('cv').insert({
      "name": resume.name,
      "email": resume.email,
      "phone": resume.phone,
      "adders": resume.adders,
      "job": resume.job,
      "aboutme": resume.aboutme,
      "education": resume.education,
      "experience": resume.experience,
      "skills": resume.skills,
      "projects": resume.projects,
      "references": resume.references,
    });
  }

  //update Resume
  Future updateResume({required ResumeModel resume}) async {
    await supabase.from('cv').update({
      "name": resume.name,
      "email": resume.email,
      "phone": resume.phone,
      "adders": resume.adders,
      "job": resume.job,
      "aboutme": resume.aboutme,
      "education": resume.education,
      "experience": resume.experience,
      "skills": resume.skills,
      "projects": resume.projects,
      "references": resume.references,
    }).match({'id': supabase.auth.currentUser!.id});
  }

  //get resume
  Future<ResumeModel> getResume() async {
    final resumeData = await supabase
        .from('cv')
        .select('*')
        .match({'id': supabase.auth.currentUser!.id}).single();

    return ResumeModel.fromJson(resumeData!);
  }

  //get all resume
  Future<List<ResumeModel>> getAllResume() async {
    final resumeDataList = await supabase
        .from('cv')
        .select('*')
        .match({'published': true}).neq('id', supabase.auth.currentUser!.id);
    List<ResumeModel> resumes = [];
    for (var element in resumeDataList) {
      resumes.add(ResumeModel.fromJson(element));
    }
    return resumes;
  }

  //delete resume
  Future deleteResume() async {
    await supabase
        .from('cv')
        .delete()
        .match({'id': supabase.auth.currentUser!.id});
  }

  //update published
  Future updatePublished(bool isPublished) async {
    await supabase.from('cv').update({'published': isPublished}).match(
        {'id': supabase.auth.currentUser!.id});
  }
}
