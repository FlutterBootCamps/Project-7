class Education {
  Education({
    this.id,
    required this.degree,
    required this.school,
    required this.country,
    required this.city,
    required this.startDate,
    required this.endDate,
    required this.resumeId,
  });

  late final int? id;
  late String degree;
  late String school;
  late String country;
  late String city;
  late DateTime? startDate;
  late DateTime? endDate;
  int resumeId; 
  
  Education.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        degree = json['degree'],
        school = json['school'],
        country = json['country'],
        city = json['city'],
        startDate = DateTime.parse(json['startDate']),
        endDate = DateTime.parse(json['endDate']),
        resumeId = json['resumeId'];

  Map<String, dynamic> toJson() {
    return {
      'degree': degree,
      'school': school,
      'country': country,
      'city': city,
      'startDate': startDate!.toIso8601String(),
      'endDate': endDate!.toIso8601String(),
      'resumeId': resumeId,
    };
  }
}