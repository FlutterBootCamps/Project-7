import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:try_auth_suba/model/cv_model.dart';

class Serves{
final box=GetStorage();
String token="";
String user_id="";
AddToken({required String token})async{
  print("save $token");
  await box.write('token', token);
  box.save();
}
GetToken(){
  if(box.hasData("token")){
    token=box.read('token');
    return token;

  }else {
    return "";
  }
}


  final supabase=Supabase.instance.client;

  Future<List> getCv() async{
    final CVData=await supabase.from('cv').select('*');
    List CVs=[];
    for (var note in CVData) {
CVs.add(note);
    }
    return CVs;
  }
    Future getCVOfUser() async{
    final noteData=await supabase.from('cv').select('*').eq("user_id", user_id);
    print(noteData);
    return noteData;
  }

    Future insertDataUser(String name,String email,String password) async {
    await supabase
        .from('user')
        .insert([
          {'name': name, 'email': email,'password':password},
        ]).select();
        
}

    Future insertCv(CV cv) async {
    await supabase
        .from('cv')
        .insert([
          {'user_id':"21db49ba-c9e8-4348-8933-2a4c7a7bdaa5",
           'name':cv.name,
           'address':cv.address,
           'phone':cv.phone,
           'email':cv.email,
           'git_hub_link':cv.githubLink,
           'linked_in_link':cv.linkedInLink,
           'summary':cv.summary,
           'education':json.encode(cv.education),
           'certification':json.encode(cv.certification),
           'experience':json.encode(cv.experience),
           'skills':json.encode(cv.skills),
           'languages':json.encode(cv.languages),
           'interests':cv.interests,
           'project':json.encode(cv.project),
           'references_person':json.encode(cv.references),
           },
        ]);
        
}

Future deleteNoteData(String id) async {
    await supabase
        .from('note')
        .delete()
        .eq('id',id);
}
Future updateData(String id,String note) async {
    await supabase
        .from('note')
        .update({'note': note})
        .eq('id',id);
}

Future<User?>getUserIdByToken() async{
  final token=supabase.auth.currentSession!.accessToken;
  final userRes =await supabase.auth.getUser(token);
user_id =userRes.user!.id;
  return userRes.user;
}
Future<User?>getUserNameByToken() async{
  final token=supabase.auth.currentSession!.accessToken;
  final userRes =await supabase.auth.getUser(token);
  return userRes.user;

}
}