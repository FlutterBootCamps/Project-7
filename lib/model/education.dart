class Education {
  String institution;
  String degree;
  String fieldOfStudy;
  String startDate;
  String endDate;

  Education({
    required this.institution,
    required this.degree,
    required this.fieldOfStudy,
    required this.startDate,
    required this.endDate,
  });

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        institution: json['institution'],
        degree: json['degree'],
        fieldOfStudy: json['fieldOfStudy'],
        startDate: json['startDate'],
        endDate: json['endDate'],
      );

  Map<String, dynamic> toJson() => {
        'institution': institution,
        'degree': degree,
        'fieldOfStudy': fieldOfStudy,
        'startDate': startDate,
        'endDate': endDate,
      };
      @override
  String toString() {
    return '{Institution: $institution, Degree: $degree, Field of Study: $fieldOfStudy, Start Date: $startDate, EndDate: $endDate}';
  }
}
