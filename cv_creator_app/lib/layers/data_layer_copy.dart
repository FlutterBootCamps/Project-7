import 'package:cv_creator_app/models/cv_model.dart';
import 'package:cv_creator_app/models/project_model.dart';
import 'package:get_storage/get_storage.dart';

class 
DataService1 {
  final box = GetStorage();

  String token = '';
  String userId = '';
  String userName ='';
  CVModel userCV = CVModel(
    name: '', 
    email: "", 
    phone: "", 
    educations: Educations(major: "", endDate: "", startDate: "", university: ""), 
    projects: Projects(projectTitle: "", projectDescription: ""), 
    skills: Skills(skillTitle: "", skillTitle1: "", skillTitle2: ""), 
    experiences: Experiences(endDate: '', position: "", startdate: "", companyName: "", description: ""), 
    references: "", 
    location: ""
    );

  addToken() async {
    if (token.isNotEmpty) {
      await box.write("token", token);
    }
    if (userId.isNotEmpty) {
      await box.write("userId", userId);
    }
    box.save();
  }

  getToken() {
    if (token.isEmpty) {
      token = box.read("token") ?? "";
    }
    if (userId.isEmpty) {
      userId = box.read("userId") ?? "";
    }
  }

  removeToken(){
    box.remove("token");
  }


  //!!!!!!!!!!!!-------------------------
  List<ProjectModel> projects = [];
  
  void addproject (){
  projects.add( ProjectModel(title : '', description: ''));
  }

  UpdateProjectTitle({ required int index,  required String title}){
    projects[index].title = title;
  }
  UpdateProjectDescription({ required int index,  required String description}){
    projects[index].title = description;
  }

  


}
