
class Resume {
  Resume({
    this.id,
    required this.cvName,
    required this.creationDate,
    required this.fullName,
    required this.jobTitle,
    required this.email,
    required this.phone,
    required this.address,
    required this.userId,
    this.isPublic,
  });

  late final int? id;
  late final String cvName;
  late final DateTime creationDate;
  late String fullName;
  late String jobTitle;
  late String email;
  late String phone;
  late String address;
  String userId;
  bool? isPublic;

  Resume.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        cvName = json['cv_name'],
        creationDate = DateTime.parse(json['creation_date']),
        fullName = json['full_name'],
        jobTitle = json['job_title'],
        email = json['email'],
        phone = json['phone'],
        address = json['address'],
        userId = json['userId'],
        isPublic = json['isPublic'];


  Map<String, dynamic> toJson() {
    return {
      'cv_name': cvName,
      'creation_date': creationDate.toIso8601String(),
      'full_name': fullName,
      'job_title': jobTitle,
      'email': email,
      'phone': phone,
      'address': address,
      'userId': userId,
      'isPublic': isPublic ?? false
    };
  }
}
