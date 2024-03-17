class CV {
  String name;
  String summary;
  String education;
  String experience;
  String skills;
  String languages;

  CV({
    required this.name,
    required this.summary,
    required this.education,
    required this.experience,
    required this.skills,
    required this.languages,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'summary': summary,
      'education': education,
      'experience': experience,
      'skills': skills,
      'languages': languages,
    };
  }

  factory CV.fromJson(Map<String, dynamic> json) {
    return CV(
      name: json['name'] ?? "",
      summary: json['summary'] ?? "",
      education: json['Education'] ?? "",
      experience: json['Experience'] ?? "",
      skills: json['Skills'] ?? "",
      languages: json['Languages'] ?? "",
    );
  }
}
