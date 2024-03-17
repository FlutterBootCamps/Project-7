class ResumeModel {
  String? name;
  String? email;
  String? phone;
  String? adders;
  String? job;
  String? aboutme;
  String? education;
  String? experience;
  String? skills;
  String? projects;
  String? references;
  bool? published;

  ResumeModel(
      {this.name,
      this.email,
      this.phone,
      this.adders,
      this.job,
      this.aboutme,
      this.education,
      this.experience,
      this.skills,
      this.projects,
      this.references,
      this.published});

  ResumeModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    adders = json['adders'];
    job = json['job'];
    aboutme = json['aboutme'];
    education = json['education'];
    experience = json['experience'];
    skills = json['skills'];
    projects = json['projects'];
    references = json['references'];
    published = json['published'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['adders'] = this.adders;
    data['job'] = this.job;
    data['aboutme'] = this.aboutme;
    data['education'] = this.education;
    data['experience'] = this.experience;
    data['skills'] = this.skills;
    data['projects'] = this.projects;
    data['references'] = this.references;
    data['published'] = this.published;
    return data;
  }
}