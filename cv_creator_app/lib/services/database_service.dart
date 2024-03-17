import 'package:cv_creator_app/layers/data_layer.dart';
import 'package:cv_creator_app/models/cv_model.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DBService {
  final locator = GetIt.I.get<DataService>();

  // -- Client
  SupabaseClient supabase = Supabase.instance.client;

  // --  Sign Up Method
  signUP({required String email, required String password}) async {
    await supabase.auth.signUp(
      email: email,
      password: password,
    );
  }

  // -- Sign In Method
  signIn({required String email, required String password}) async {
    final res = await supabase.auth
        .signInWithPassword(password: password, email: email);
    locator.token = supabase.auth.currentSession!.accessToken ?? '';
    locator.addToken();
    locator.userId = res.user!.id;
    print("${locator.userId} --------------------- id locator -------");
    return res.user!.id;
  }

  // -- Add user to user table
  Future insertUser({String? name, String? email, String? password}) async {
    await supabase
        .from('user')
        .insert({'name': name, 'email': email, 'password': password});
  }

  // -- sign out
  singOut() async {
    await supabase.auth.signOut();
    locator.removeToken();
  }

  //  -- get token
  Future<String> getUserByToken() async {
    final token = supabase.auth.currentSession!.accessToken;
    final userResponse = await supabase.auth.getUser(token);
    final user = userResponse.user!.id;

    return user;
  }

  //  Get user name
  Future<String> getUser() async {
    final user =
        await supabase.from('user').select('name').eq('id', locator.userId);
    print(user);
    print("SSSSSS---------- ${user.runtimeType}------ssssss");
    String userName = user[0]['name'];
    locator.userName = userName;
    print(userName);

    return userName;
  }

  // -- Get all CV
  Future getAllCV() async {
    final cvData = await supabase.from('CV').select();
    print(cvData.runtimeType);
    List<CVModel> usersCV = [];

    //  Add CV to list
    for (var element in cvData) {
      usersCV.add(CVModel.fromJson(element));
    }
    return usersCV;
  }

  // --   Get only User CV
  Future getUserCV() async {
    final cvData = await supabase.from('CV').select().eq('id', locator.userId);
    List<CVModel> usersCV = [];

    //  Add CV to list
    for (var element in cvData) {
      usersCV.add(CVModel.fromJson(element));
    }
    return usersCV;
  }

  // Delete user CV
  Future deleteCv() async {
    await supabase.from('CV').delete().eq('id', locator.userId);
  }

  //  -- Add  user CV
  Future addCV({required CVModel userCV}) async {
    await supabase.from('CV').insert({
      'name': userCV.name,
      'email': userCV.email,
      'phone': userCV.phone,
      'educations': userCV.educations,
      'projects': userCV.projects,
      'skills': userCV.skills,
      'experiences': userCV.experiences,
      'location': userCV.location,
      // 'references' : userCV.references,
    });
    print("Add successfully");
  }

  // -- Update user CV
  Future updateUserCV({required CVModel updateUserCV}) async {
    await supabase.from("CV").update({
      'name': updateUserCV.name,
      'email': updateUserCV.email,
      'phone': updateUserCV.phone,
      'educations': updateUserCV.educations,
      'projects': updateUserCV.projects,
      'skills': updateUserCV.skills,
      'experiences': updateUserCV.experiences,
      'location': updateUserCV.location,
      // 'references' : updateUserCV.references,
    }).eq('id', locator.userId);
  }
}
