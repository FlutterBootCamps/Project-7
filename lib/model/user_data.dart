class UserDataModel {
  int? id;
  String fullName;
  String phone;
  String email;
  String dateOfBirth;
  String city;
  String abstract;
  String education;
  String dateEducation;
  String workExperience;
  String dateWorkExperience;
  String skills; 
  String languages; 
 

  UserDataModel({
     this.id,
    required this.fullName,
    required this.phone,
    required this.email,
    required this.dateOfBirth,
    required this.city,
    required this.abstract,
    required this.education,
    required this.dateEducation,
    required this.workExperience,
    required this.dateWorkExperience,
    required this.skills, 
    required this.languages, 
   
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      
      fullName: json['Full_Name'],
      phone: json['Phone'],
      email: json['Email'],
      dateOfBirth: json['Date_of_Birth'],
      city: json['City'],
      abstract: json['Abstract'],
      education: json['Education'],
      dateEducation: json['Date_Education'],
      workExperience: json['Work_Experience'],
      dateWorkExperience: json['Date_Work_Experience'],
      skills: json['Skills'],
      languages: json['Languages'],
     
    );
  }

  Map<String, dynamic> toJson() {
    return {
      
      "Full_Name": fullName,
      "Phone": phone,
      "Email": email,
      "Date_of_Birth": dateOfBirth,
      "City": city,
      "Abstract": abstract,
      "Education": education,
      "Date_Education": dateEducation,
      "Work_Experience": workExperience,
      "Date_Work_Experience": dateWorkExperience,
      "Skills": skills,
      "Languages": languages,
      
    };
  }
}
