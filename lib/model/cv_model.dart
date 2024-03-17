import 'package:try_auth_suba/model/Project.dart';
import 'package:try_auth_suba/model/certification.dart';
import 'package:try_auth_suba/model/education.dart';
import 'package:try_auth_suba/model/experience.dart';
import 'package:try_auth_suba/model/references.dart';

class CV {
  String name;
  String address;
  String phone;
  String email;
  String? githubLink;
  String? linkedInLink;
  String summary;
  List<Education> education;
  List<Certification> certification;
  List<Experience> experience;
  List<String> skills;
  List<String> languages;
  String? interests;
  List<Project> project;
  List<Reference>? references;
  String userId;
CV({
  required this.name,
  required this.address,
  required this.phone,
  required this.email,
  this.githubLink,
  this.linkedInLink,
  required this.summary,
  this.interests,
  required List<Reference> references,
  required this.userId,
  required List<Education> educations, 
  required List<Certification> certifications, 
  required List<Experience> experiences,
  required List<Project> projects, 
  required List<String> skills,
  required List<String> languages,
})  : education = educations,
      certification = certifications,
      experience = experiences,
      skills = skills,
      languages = languages,
      project = projects,
      references = references;

  factory CV.fromJson(Map<String, dynamic> json) => CV(
        name: json['name'],
        address: json['address'],
        phone: json['phone'],
        email: json['email'],
        githubLink: json['githubLink'],
        linkedInLink: json['linkedInLink'],
        summary: json['summary'],
        educations: (json['education'] as List)
            .map((edu) => Education.fromJson(edu))
            .toList(),
        certifications: (json['certification'] as List)
            .map((cert) => Certification.fromJson(cert))
            .toList(),
        experiences: (json['experience'] as List)
            .map((exp) => Experience.fromJson(exp))
            .toList(),
        skills: List<String>.from(json['skills']),
        languages: List<String>.from(json['languages']),
        interests: json['interests'],
        projects: (json['project'] as List)
            .map((proj) => Project.fromJson(proj))
            .toList(),
        references: (json['experience'] as List)
            .map((exp) => Reference.fromJson(exp))
            .toList(),
        userId: json['userId'],
      );
  Map<String, dynamic> toJson() => {
        'name': name,
        'address': address,
        'phone': phone,
        'email': email,
        'githubLink': githubLink,
        'linkedInLink': linkedInLink,
        'summary': summary,
        'education': education.map((edu) => edu.toJson()).toList(),
        'certification': certification.map((cert) => cert.toJson()).toList(),
        'experience': experience.map((exp) => exp.toJson()).toList(),
        'skills': skills,
        'languages': languages,
        'interests': interests,
        'project': project.map((proj) => proj.toJson()).toList(),
        'references': references,
        'userId': userId,
      };
}
