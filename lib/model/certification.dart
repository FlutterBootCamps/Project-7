class Certification {
  String title;
  String organization;
  String date;
  String description;

  Certification({
    required this.title,
    required this.organization,
    required this.date,
    required this.description,
  });

  factory Certification.fromJson(Map<String, dynamic> json) => Certification(
        title: json['title'],
        organization: json['organization'],
        date: json['date'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'organization': organization,
        'date': date,
        'description': description,
      };
}
