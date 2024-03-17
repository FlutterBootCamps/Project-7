

import 'package:project8/model/cv_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DataBase {
  final supabase = Supabase.instance.client;

  Future signUp({required String email, required String password}) async {
    print('aa');
    await supabase.auth.signUp(
      email: email,
      password: password,
    );
    print('bb');
  }

Future signIn({required String email,required String password}) async {
    await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
}
Future fetchCV() async {
    final cvdata = await supabase.from('cv').select('*');
   print('list her 0');
    List<CV> classcv = [];
     print('list her 1');
    for (var element in cvdata) {
      classcv.add(CV.fromJson(element));
    }
    print('list her');
     return classcv;
  }
 // Function to insert a new CV
Future insertCV(CV cv) async {
  // Get the user ID of the signed-in user
  final user = supabase.auth.currentUser;
  if (user != null) {
    final userId = user.id;

    // Insert the CV with the user ID
    await supabase.from('cv').insert({
      'First Name': cv.first,
      'Last Name': cv.last,
      'Profession': cv.profession,
      'Email': cv.email,
      'Phone Number': cv.phone,
      'Country': cv.country,
      'City': cv.city,
      'Address': cv.address,
      'Portfolio': cv.portfolio,
      'Objective': cv.objective,
      'Position': cv.position,
      'Company': cv.company,
      'Study_program': cv.studyProgram,
      'PlaceEducation': cv.placeEducation,
      'GPA': cv.gpa,
      'ProjectName': cv.projectName,
      'projectDescription': cv.projectDescription,
      'Skills': cv.skills,
      'Organization': cv.organization,
    });
  }
}
Future deletCV(CV cv) async {
  await supabase
  .from('cv')
  .delete()
  .match({ 'id': cv.id })
   .select();
}
Future updateCV(CV cv) async {
  await supabase.from('cv').update({
     'First Name': cv.first,
      'Last Name': cv.last,
      'Profession': cv.profession,
      'Email': cv.email,
      'Phone Number': cv.phone,
      'Country': cv.country,
      'City': cv.city,
      'Address': cv.address,
      'Portfolio': cv.portfolio,
      'Objective': cv.objective,
      'Position': cv.position,
      'Company': cv.company,
      'Study_program': cv.studyProgram,
      'PlaceEducation': cv.placeEducation,
      'GPA': cv.gpa,
      'ProjectName': cv.projectName,
      'projectDescription': cv.projectDescription,
      'Skills': cv.skills,
      'Organization': cv.organization,
  }).eq('id', cv.id).select();
}
}
Future getUserId() async {
  final user = Supabase.instance.client.auth.currentUser;
  if (user != null) {
    return user.id;
  } else {
    return null;
  }
}