class Project {
  String title;
  String description;
  String startDate;
  String endDate;

  Project({
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        title: json['title'],
        description: json['description'],
        startDate: json['startDate'],
        endDate: json['endDate'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'startDate': startDate,
        'endDate': endDate,
      };
}
