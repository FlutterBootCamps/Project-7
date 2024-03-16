class Project {
  Project({
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.resumeId,
  });

  late final int? id;
  late String title;
  late String description;
  late DateTime startDate;
  late DateTime endDate;
  int resumeId;
  
  Project.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        startDate = DateTime.parse(json['startDate']),
        endDate = DateTime.parse(json['endDate']),
        resumeId = json['resumeId'];

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'resumeId': resumeId,
    };
  }
}