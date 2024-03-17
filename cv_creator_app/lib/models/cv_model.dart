
class CVModel {
  CVModel({
    this.id,
    this.createdAt,
    required this.name,
    required this.email,
    required this.phone,
    required this.educations,
    required this.projects,
    required this.skills,
    required this.experiences,
     this.references,
    required this.location,
  });
  late final String? id;
  late final String? createdAt;
  late final String name;
  late final String email;
  late final String phone;
  late final Educations educations;
  late final Projects projects;
  late final Skills skills;
  late final Experiences experiences;
  late final void references;
  late final String location;
  
  CVModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    createdAt = json['created_at'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    educations = Educations.fromJson(json['educations']);
    projects = Projects.fromJson(json['projects']);
    skills = Skills.fromJson(json['skills']);
    experiences = Experiences.fromJson(json['experiences']);
    references = null;
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['educations'] = educations.toJson();
    data['projects'] = projects.toJson();
    data['skills'] = skills.toJson();
    data['experiences'] = experiences.toJson();
    data['references'] = null;
    data['location'] = location;
    return data;
  }
}

class Educations {
  Educations({
    required this.major,
    required this.endDate,
    required this.startDate,
    required this.university,
  });
  late final String major;
  late final String endDate;
  late final String startDate;
  late final String university;
  
  Educations.fromJson(Map<String, dynamic> json){
    major = json['major'];
    endDate = json['endDate'];
    startDate = json['startDate'];
    university = json['university'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['major'] = major;
    data['endDate'] = endDate;
    data['startDate'] = startDate;
    data['university'] = university;
    return data;
  }
}

class Projects {
  Projects({
    required this.projectTitle,
    required this.projectDescription,
  });
  late final String projectTitle;
  late final String projectDescription;
  
  Projects.fromJson(Map<String, dynamic> json){
    projectTitle = json['projectTitle'];
    projectDescription = json['projectDescription'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['projectTitle'] = projectTitle;
    data['projectDescription'] = projectDescription;
    return data;
  }
}

class Skills {
  Skills({
    required this.skillTitle,
    required this.skillTitle1,
    required this.skillTitle2,
  });
  late final String skillTitle;
  late final String skillTitle1;
  late final String skillTitle2;
  
  Skills.fromJson(Map<String, dynamic> json){
    skillTitle = json['skillTitle'];
    skillTitle1 = json['skillTitle1'];
    skillTitle2 = json['skillTitle2'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['skillTitle'] = skillTitle;
    data['skillTitle1'] = skillTitle1;
    data['skillTitle2'] = skillTitle2;
    return data;
  }
}

class Experiences {
  Experiences({
    required this.endDate,
    required this.position,
    required this.startdate,
    required this.companyName,
    required this.description,
  });
  late final String endDate;
  late final String position;
  late final String startdate;
  late final String companyName;
  late final String description;
  
  Experiences.fromJson(Map<String, dynamic> json){
    endDate = json['endDate'];
    position = json['position'];
    startdate = json['startdate'];
    companyName = json['companyName'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['endDate'] = endDate;
    data['position'] = position;
    data['startdate'] = startdate;
    data['companyName'] = companyName;
    data['description'] = description;
    return data;
  }
}


// // class CVModel {
// //   CVModel({
// //     required this.name,
// //     required this.email,
// //     required this.phone,
// //     required this.location,
// //     required this.education,
// //     required this.skills,
// //     required this.experiences,
// //     required this.projects,
// //     // required this.references,
// //   });
// //   late final String name;
// //   late final String email;
// //   late final String phone;
// //   late final String location;
// //   late final List<Education> education;
// //   late final List<Skills> skills;
// //   late final List<Experiences> experiences;
// //   late final List<Projects> projects;
// //   // late final List<References>? references;
  
// //   CVModel.fromJson(Map<String, dynamic> json){
// //     name = json['name'];
// //     email = json['email'];
// //     phone = json['phone'];
// //     location = json['location'];
// //     education = List.from(json['education']).map((e)=>Education.fromJson(e)).toList();
// //     skills = List.from(json['skills']).map((e)=>Skills.fromJson(e)).toList();
// //     experiences = List.from(json['experiences']).map((e)=>Experiences.fromJson(e)).toList();
// //     projects = List.from(json['projects']).map((e)=>Projects.fromJson(e)).toList();
// //     // references = List.from(json['references']).map((e)=>References.fromJson(e)).toList();
// //   }

// //   Map<String, dynamic> toJson() {
// //     final data = <String, dynamic>{};
// //     data['name'] = name;
// //     data['email'] = email;
// //     data['phone'] = phone;
// //     data['location'] = location;
// //     data['education'] = education.map((e)=>e.toJson()).toList();
// //     data['skills'] = skills.map((e)=>e.toJson()).toList();
// //     data['experiences'] = experiences.map((e)=>e.toJson()).toList();
// //     data['projects'] = projects.map((e)=>e.toJson()).toList();
// //     // data['references'] = references?.map((e)=>e.toJson()).toList();
// //     return data;
// //   }
// // }

// // class Education {
// //   Education({
// //     required this.major,
// //     required this.university,
// //     required this.startDate,
// //     required this.endDate,
// //   });
// //   late final String major;
// //   late final String university;
// //   late final String startDate;
// //   late final String endDate;
  
// //   Education.fromJson(Map<String, dynamic> json){
// //     major = json['major'];
// //     university = json['university'];
// //     startDate = json['startDate'];
// //     endDate = json['endDate'];
// //   }

// //   Map<String, dynamic> toJson() {
// //     final data = <String, dynamic>{};
// //     data['major'] = major;
// //     data['university'] = university;
// //     data['startDate'] = startDate;
// //     data['endDate'] = endDate;
// //     return data;
// //   }
// // }

// // class Skills {
// //   Skills({
// //     required this.skillTitle,
// //     required this.skillTitle1,
// //     required this.skillTitle2,
// //     required this.skillTitle3,
// //   });
// //   late final String skillTitle;
// //   late final String skillTitle1;
// //   late final String skillTitle2;
// //   late final String skillTitle3;
  
// //   Skills.fromJson(Map<String, dynamic> json){
// //     skillTitle = json['skillTitle'];
// //     skillTitle1 = json['skillTitle1'];
// //     skillTitle2 = json['skillTitle2'];
// //     skillTitle3 = json['skillTitle3'];
// //   }

// //   Map<String, dynamic> toJson() {
// //     final data = <String, dynamic>{};
// //     data['skillTitle'] = skillTitle;
// //     data['skillTitle1'] = skillTitle1;
// //     data['skillTitle2'] = skillTitle2;
// //     data['skillTitle3'] = skillTitle3;
// //     return data;
// //   }
// // }

// // class Experiences {
// //   Experiences({
// //     required this.position,
// //     required this.companyName,
// //     required this.startdate,
// //     required this.endDate,
// //     required this.description,
// //   });
// //   late final String position;
// //   late final String companyName;
// //   late final String startdate;
// //   late final String endDate;
// //   late final String description;
  
// //   Experiences.fromJson(Map<String, dynamic> json){
// //     position = json['position'];
// //     companyName = json['companyName'];
// //     startdate = json['startdate'];
// //     endDate = json['endDate'];
// //     description = json['description'];
// //   }

// //   Map<String, dynamic> toJson() {
// //     final data = <String, dynamic>{};
// //     data['position'] = position;
// //     data['companyName'] = companyName;
// //     data['startdate'] = startdate;
// //     data['endDate'] = endDate;
// //     data['description'] = description;
// //     return data;
// //   }
// // }

// // class Projects {
// //   Projects({
// //     required this.projectTitle,
// //     required this.projectDescription,
// //   });
// //   late final String projectTitle;
// //   late final String projectDescription;
  
// //   Projects.fromJson(Map<String, dynamic> json){
// //     projectTitle = json['projectTitle'];
// //     projectDescription = json['projectDescription'];
// //   }

// //   Map<String, dynamic> toJson() {
// //     final data = <String, dynamic>{};
// //     data['projectTitle'] = projectTitle;
// //     data['projectDescription'] = projectDescription;
// //     return data;
// //   }
// // }

// // // class References {
// // //   References({
// // //     required this.referencetitle,
// // //   });
// // //   late final String referencetitle;
  
// // //   References.fromJson(Map<String, dynamic> json){
// // //     referencetitle = json['referencetitle'];
// // //   }

// // //   Map<String, dynamic> toJson() {
// // //     final data = <String, dynamic>{};
// // //     data['referencetitle'] = referencetitle;
// // //     return data;
// // //   }
// // // }


// class CVModel {
//   CVModel({
//      this.id,
//      this.createdAt,
//     required this.name,
//     required this.email,
//     required this.phone,
//     required this.educations,
//      this.projects,
//     required this.skills,
//     required this.experiences,
//      this.references = "R",
//     required this.location,
//   });
//   late final String? id;
//   late final String? createdAt;
//   late final String name;
//   late final String email;
//   late final String phone;
//   late final Educations educations;
//   late final Projects? projects;
//   late final Skills skills;
//   late final Experiences experiences;
//   late final String? references;
//   late final String location;
  
//   CVModel.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     createdAt = json['created_at'];
//     name = json['name'];
//     email = json['email'];
//     phone = json['phone'];
//     educations = Educations.fromJson(json['educations']);
//     projects = Projects.fromJson(json['projects']);
//     skills = Skills.fromJson(json['skills']);
//     experiences = Experiences.fromJson(json['experiences']);
//     references = null;
//     location = json['location'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['created_at'] = createdAt;
//     data['name'] = name;
//     data['email'] = email;
//     data['phone'] = phone;
//     data['educations'] = educations.toJson();
//     data['projects'] = projects!.toJson();
//     data['skills'] = skills.toJson();
//     data['experiences'] = experiences.toJson();
//     data['references'] = references;
//     data['location'] = location;
//     return data;
//   }
// }

// class Educations {
//   Educations({
//     required this.major,
//     required this.endDate,
//     required this.startDate,
//     required this.university,
//   });
//   late final String major;
//   late final String endDate;
//   late final String startDate;
//   late final String university;
  
//   Educations.fromJson(Map<String, dynamic> json){
//     major = json['major'];
//     endDate = json['endDate'];
//     startDate = json['startDate'];
//     university = json['university'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['major'] = major;
//     data['endDate'] = endDate;
//     data['startDate'] = startDate;
//     data['university'] = university;
//     return data;
//   }
// }

// class Projects {
//   Projects({
//      this.projectTitle ='p',
//      this.projectDescription= 'p',
//   });
//   late final String? projectTitle;
//   late final String? projectDescription;
  
//   Projects.fromJson(Map<String, dynamic> json){
//     projectTitle = json['projectTitle'];
//     projectDescription = json['projectDescription'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['projectTitle'] = projectTitle;
//     data['projectDescription'] = projectDescription;
//     return data;
//   }
// }

// class Skills {
//   Skills({
//     required this.skillTitle,
//       this.skillTitle1 ="s",
//       this.skillTitle2 ="s",
//   });
//   late final String skillTitle;
//   late final String? skillTitle1;
//   late final String? skillTitle2;
  
//   Skills.fromJson(Map<String, dynamic> json){
//     skillTitle = json['skillTitle'];
//     skillTitle1 = json['skillTitle1'];
//     skillTitle2 = json['skillTitle2'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['skillTitle'] = skillTitle;
//     data['skillTitle1'] = skillTitle1;
//     data['skillTitle2'] = skillTitle2;
//     return data;
//   }
// }

// class Experiences {
//   Experiences({
//     required this.endDate,
//     required this.position,
//     required this.startdate,
//     required this.companyName,
//     required this.description,
//   });
//   late final String endDate;
//   late final String position;
//   late final String startdate;
//   late final String companyName;
//   late final String description;
  
//   Experiences.fromJson(Map<String, dynamic> json){
//     endDate = json['endDate'];
//     position = json['position'];
//     startdate = json['startdate'];
//     companyName = json['companyName'];
//     description = json['description'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['endDate'] = endDate;
//     data['position'] = position;
//     data['startdate'] = startdate;
//     data['companyName'] = companyName;
//     data['description'] = description;
//     return data;
//   }
// }