class Skill {
  Skill({
    this.id,
    required this.skill,
    required this.description,
    required this.resumeId,
  });
  late final int? id;
  late String skill;
  late String description;
  late int resumeId;
  
  Skill.fromJson(Map<String, dynamic> json){
    id = json['id'];
    skill = json['skill'];
    description = json['description'];
    resumeId = json['resumeId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['skill'] = skill;
    _data['description'] = description;
    _data['resumeId'] = resumeId;
    return _data;
  }
}