import 'package:project7/model/cv_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DBService {
  SupabaseClient supabase = Supabase.instance.client;
  Future signUp({required String email, required String password}) async {
    await supabase.auth.signUp(email: email, password: password);
  }

  Future logInAccount({required String email, required String password}) async {
    final res = await supabase.auth
        .signInWithPassword(email: email, password: password);
    return res.user!.id;
  }

  Future logOut() async {
    await supabase.auth.signOut();
  }

  Future<String> getUserByToken() async {
    final token = supabase.auth.currentSession?.accessToken;
    final userResponse = await supabase.auth.getUser(token);
    final user = userResponse.user!.id;
    return user;
  }

  Future<List<CV>> fetchCV() async {
    final cvData = await supabase.from('cv').select('*').match({'id':supabase.auth.currentSession!.user.id});
    List<CV> classCv = [];
    for (var element in cvData) {
      classCv.add(CV.fromJson(element));
    }
    return classCv;
  }
  Future<List<CV>> fetchAllCvs() async {
    final allcvData = await supabase.from('cv').select('*');
    List<CV> classallCv = [];
    for (var element in allcvData) {
      classallCv.add(CV.fromJson(element));
    }
    return classallCv;
  }

  Future insertData(String name, String summary, String education,
      String experience, String skills, String languages) async {
    try {
      await supabase.from('cv').insert({
        "name": name,
        "summary": summary,
        "Education": education,
        "Experience": experience,
        "Skills": skills,
        "Languages": languages
      });
    } catch (e) {
      print(e);
    }
  }

  Future deleteData() async {
    await supabase.from('cv').delete().match({'id':supabase.auth.currentSession!.user.id});
  }
  Future logOutUser() async {
    await supabase.auth.signOut();
  }

  Future updateData({ required String name, required String summary, required String education,
      required String experience, required String skills, required String languages}) async {
      await supabase.from('cv').update({
        "name": name,
        "summary": summary,
        "Education": education,
        "Experience": experience,
        "Skills": skills,
        "Languages": languages
      }
      ).match({'id':supabase.auth.currentSession!.user.id});
  }
}
