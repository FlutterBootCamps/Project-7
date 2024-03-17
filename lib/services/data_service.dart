import 'package:cv_app/models/cv_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:get_storage/get_storage.dart';

class DataBase {
  final SupabaseClient supabase = Supabase.instance.client;
  String token = "";
  final box = GetStorage();
  var userId = "";
  String emailUser = "";
  String phone = "";

  Future signup(
      {required String password,
      required String email,
      required String phone}) async {
    print('entered');
    await supabase.auth.signUp(
      password: password,
      email: email,
    );
    print('finish');
  }

  Future signin({required String password, required String email}) async {
    final res = await supabase.auth
        .signInWithPassword(password: password, email: email);
    userId = res.user!.id;
    emailUser = res.user!.email!;
    phone = res.user!.phone!;
  }

  Future signout() async {
    await supabase.auth.signOut();
  }

  addToken() async {
    if (token.isNotEmpty) {
      await box.write('token', token);
      box.save();
    }
  }

  getToken() {
    token = box.read('token') ?? "";
  }

  Future<void> addToSupabase(CvModel resume) async {
    await supabase.from('cv').insert(resume.toJson());
  }

  Future<void> updateCV(CvModel resume) async {
    await supabase.from('cv').update(resume.toJson()).match({"id": resume.id});
  }

  Future<void> deleteCV(CvModel resume) async {
    await supabase.from('cv').delete().match({"id": resume.id});
  }

  Future<List<CvModel>> fetchListResumes() async {
    print("fun");
    final cvList = await supabase.from('cv').select('*');
    List<CvModel> resumeList = cvList.map((e) => CvModel.fromJson(e)).toList();
    return resumeList;
  }

  Future<List<CvModel>> fetcPreviusResumes() async {
    print("fun");
    print(userId);
    final cvList =
        await supabase.from('cv').select('*').match({'user_id': userId});

    List<CvModel> resumeList = cvList.map((e) => CvModel.fromJson(e)).toList();
    return resumeList;
  }
}
