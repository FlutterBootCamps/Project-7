
//add Opjective+ Position +Company +Study_program+PlaceEducation+GPA+ProjectName+projectDescription+skills+Organiz

class CV {
  late int id;
  late String first;
  late String last;
  late String profession;
  late String email;
  late int phone;
  late String country;
  late String city;
  late String address;
  late String portfolio;
  late String userid;
  late String objective;
  late String position;
  late String company;
  late String studyProgram;
  late String placeEducation;
  late double gpa;
  late String projectName;
  late String projectDescription;
  late String skills;
  late String organization;

  CV({
    required this.id,
    required this.first,
    required this.last,
    required this.profession,
    required this.email,
    required this.phone,
    required this.country,
    required this.city,
    required this.address,
    required this.portfolio,
    required this.userid,
    required this.objective,
    required this.position,
    required this.company,
    required this.studyProgram,
    required this.placeEducation,
    required this.gpa,
    required this.projectName,
    required this.projectDescription,
    required this.skills,
    required this.organization,
  });

  factory CV.fromJson(Map<String, dynamic> json) {
    return CV(
      id: json['id'] as int,
      first: json['First Name'] as String,
      last: json['Last Name'] as String,
      profession: json['Profession'] as String,
      email: json['Email'] as String,
      phone: json['Phone Number'] as int,
      country: json['Country'] as String,
      city: json['City'] as String,
      address: json['Address'] as String,
      portfolio: json['Portfolio'] as String,
      userid: json['userid'] as String,
      objective: json['Objective'] as String,
      position: json['Position'] as String,
      company: json['Company'] as String,
      studyProgram: json['Study_program'] as String,
      placeEducation: json['PlaceEducation'] as String,
      gpa: json['GPA'] as double,
      projectName: json['ProjectName'] as String,
      projectDescription: json['ProjectDescription'] as String,
      skills: json['Skills']as String,
      organization: json['Organization'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'First Name': first,
      'Last Name': last,
      'Profession': profession,
      'Email': email,
      'Phone Number': phone,
      'Country': country,
      'City': city,
      'Address': address,
      'Portfolio': portfolio,
      'userid': userid,
      'Objective': objective,
      'Position': position,
      'Company': company,
      'Study_program': studyProgram,
      'PlaceEducation': placeEducation,
      'GPA': gpa,
      'ProjectName': projectName,
      'ProjectDescription': projectDescription,
      'Skills': skills,
      'Organization': organization,
    };
  }
}
