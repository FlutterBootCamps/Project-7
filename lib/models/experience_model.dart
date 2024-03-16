class Experience {
  Experience({
    this.id,
    required this.jobTitle,
    required this.employer,
    required this.country,
    required this.city,
    required this.startDate,
    required this.endDate,
    required this.resumeId,
  });

  late final int? id;
  late String jobTitle;
  late String employer;
  late String country;
  late String city;
  late DateTime startDate;
  late DateTime endDate;
  int resumeId;
  
  Experience.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        jobTitle = json['job_title'],
        employer = json['employer'],
        country = json['country'],
        city = json['city'],
        startDate = DateTime.parse(json['startDate']),
        endDate = DateTime.parse(json['endDate']),
        resumeId = json['resumeId'];

  Map<String, dynamic> toJson() {
    return {
      'job_title': jobTitle,
      'employer': employer,
      'country': country,
      'city': city,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'resumeId': resumeId,
    };
  }
}
