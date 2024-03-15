class UserInfo {
  UserInfo({
    required this.name,
    required this.jobField,
    required this.email,
    required this.password,
  });
  late final String name;
  late final String jobField;
  late final String email;
  late final String password;
  
  UserInfo.fromJson(Map<String, dynamic> json){
    name = json['name'];
    jobField = json['job_field'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['job_field'] = jobField;
    _data['email'] = email;
    _data['password'] = password;
    return _data;
  }
}