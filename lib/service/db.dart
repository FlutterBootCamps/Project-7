import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/user_data.dart';

class DBService {
  final supabase =Supabase.instance.client;

  Future signUp({required String email,required String password})async{
    await supabase.auth.signUp(
      email: email,
      password:password,
    
      
      );
  }

  
Future signIn({required String email,required String password})async{
 final res = await supabase.auth.signInWithPassword(
    email: email,
    password: password);
    return res.user!.id;
}
Future signOut()async {
  await supabase.auth.signOut();
}
// --------------CRUD Operations------
Future createData ( {required UserDataModel res}) async{
  await supabase.from('cv').insert(res.toJson());
 
}
 





Future fetchCvData()async{
  final cvData = await supabase.from('cv').select('*').match({'id':supabase.auth.currentSession!.user.id});
  print("Finish");
  List<UserDataModel> classCv=[];
  
  for (var element in cvData){
    classCv.add(UserDataModel.fromJson(element));
  }
  return classCv;
}

}
