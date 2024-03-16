class Reference {
  Reference({
    required this.name,
    required this.jobTitle,
    required this.organization,
    required this.email,
    required this.phone,
    required this.resumeId,
  });
  late final int? id;
  late final String name;
  late final String jobTitle;
  late final String organization;
  late final String email;
  late final String phone;
  late int resumeId;
  
  Reference.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    jobTitle = json['job_title'];
    organization = json['organization'];
    email = json['email'];
    phone = json['phone'];
    resumeId = json['resumeId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['job_title'] = jobTitle;
    _data['organization'] = organization;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['resumeId'] = resumeId;
    return _data;
  }
}