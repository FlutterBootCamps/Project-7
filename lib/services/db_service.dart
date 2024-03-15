import 'package:cv_maker_app/data_layer/home_data_layer.dart';
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

  Future insertUser({String? name, String? jobField ,String? email, String? password,}) async {
    await supabase.from('user').insert({'name': name, 'password': password, 'email': email, 'job_field': jobField});
  }

  Future<String> getUserId({required String token}) async {
    UserResponse userRes = await supabase.auth.getUser(token);
    return userRes.user!.id;
  }

  Future<UserInfo> getCurrentUserInfo() async{
    final locator = GetIt.I.get<HomeData>();
    final List = await supabase.from('user').select().match({'id': locator.currentUserId});
    UserInfo userInfo = UserInfo.fromJson(List[0]);
    return userInfo;
  }
}
