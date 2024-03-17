class CvModel {
  final int? id;
    final String? user_id;
  String name;
  String email;
  String phoneNumber;
  String workExperience;
  String skills;
  String bio;
  String experienceTitle;
  String experiencePlace;
  String experiencePeriod;
  String experienceLocation;
  String experienceDescription;
  String schoolLevel;
  String schoolName;
  String hobbies;
  String language;
  int level;
  CvModel(
      {this.id,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.workExperience,
      required this.experienceTitle,
      required this.experiencePlace,
      required this.experiencePeriod,
      required this.experienceLocation,
      required this.experienceDescription,
      required this.skills,
      required this.bio,
      required this.schoolLevel,
      required this.schoolName,
      required this.language,
      required this.level,
      required this.hobbies , required this.user_id});

  factory CvModel.fromJson(Map<String, dynamic> json) {
    return CvModel(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      workExperience: json['workExperience'] as String,
      skills: json['skills'] as String,
      bio: json['bio'] as String,
      experienceTitle: json['experienceTitle'] as String,
      experiencePlace: json['experiencePlace'] as String,
      experiencePeriod: json['experiencePeriod'] as String,
      experienceLocation: json['experienceLocation'] as String,
      experienceDescription: json['experienceDescription'] as String,
      schoolLevel: json['schoolLevel'] as String,
      schoolName: json['schoolName'] as String,
      language: json['language'] as String,
      level: json['level'] as int,
      hobbies: json['hobbies'] as String,
            user_id: json['user_id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'workExperience': workExperience,
      'skills': skills,
      'bio': bio,
      'experienceTitle': experienceTitle,
      'experiencePlace': experiencePlace,
      'experiencePeriod': experiencePeriod,
      'experienceLocation': experienceLocation,
      'experienceDescription': experienceDescription,
      'schoolLevel': schoolLevel,
      'schoolName': schoolName,
      'language': language,
      'level': level,
      'hobbies': hobbies,
      'user_id' :user_id
    };
  }
}
