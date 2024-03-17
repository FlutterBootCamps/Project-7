import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:try_auth_suba/model/cv_model.dart';
import 'package:try_auth_suba/setup/git_it.dart';

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
Future<void> insertCv(CV cv) async {
  try {
    await supabase
        .from('cv')
        .insert([
          {
            'user_id': gitIt().locator.get<Serves>().user_id,
            'name': cv.name,
            'address': cv.address,
            'phone': cv.phone,
            'email': cv.email,
            'git_hub_link': cv.githubLink,
            'linked_in_link': cv.linkedInLink,
            'summary': cv.summary,
            'education': json.encode(cv.education),
            'certification': json.encode(cv.certification),
            'experience': json.encode(cv.experience),
            'skills': json.encode(cv.skills),
            'languages': json.encode(cv.languages),
            'interests': cv.interests,
            'project': json.encode(cv.project),
            'references_person': json.encode(cv.references),
          },
        ]).select();
  } catch (error) {
    print('Error inserting CV: $error');
    // You can handle or return the error here if needed
  }
}

Future<void> updateCv(CV cv) async {
  try {
    await supabase
        .from('cv')
        .update(
          {
            'user_id': gitIt().locator.get<Serves>().user_id,
            'name': cv.name,
            'address': cv.address,
            'phone': cv.phone,
            'email': cv.email,
            'git_hub_link': cv.githubLink,
            'linked_in_link': cv.linkedInLink,
            'summary': cv.summary,
            'education': json.encode(cv.education),
            'certification': json.encode(cv.certification),
            'experience': json.encode(cv.experience),
            'skills': json.encode(cv.skills),
            'languages': json.encode(cv.languages),
            'interests': cv.interests,
            'project': json.encode(cv.project),
            'references_person': json.encode(cv.references),
          },
        ).select();
  } catch (error) {
    print('Error inserting CV: $error');
    // You can handle or return the error here if needed
  }
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