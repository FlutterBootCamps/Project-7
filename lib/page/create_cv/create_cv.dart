import 'package:flutter/material.dart';
import 'package:try_auth_suba/api/serves.dart';

import 'package:try_auth_suba/model/Project.dart';
import 'package:try_auth_suba/model/certification.dart';
import 'package:try_auth_suba/model/cv_model.dart';
import 'package:try_auth_suba/model/education.dart';
import 'package:try_auth_suba/model/experience.dart';
import 'package:try_auth_suba/model/references.dart';
import 'package:try_auth_suba/page/create_cv/certification/certification.dart';
import 'package:try_auth_suba/page/create_cv/certification/certification_add_widget.dart';
import 'package:try_auth_suba/page/create_cv/edu/edu.dart';
import 'package:try_auth_suba/page/create_cv/edu/edu_add_widget.dart';
import 'package:try_auth_suba/page/create_cv/experience/experience.dart';
import 'package:try_auth_suba/page/create_cv/experience/experince_add_widget.dart';
import 'package:try_auth_suba/page/create_cv/languages/lang_add_widget.dart';
import 'package:try_auth_suba/page/create_cv/languages/language.dart';
import 'package:try_auth_suba/page/create_cv/project/project.dart';
import 'package:try_auth_suba/page/create_cv/project/project_add_widget.dart';
import 'package:try_auth_suba/page/create_cv/reference/reference.dart';
import 'package:try_auth_suba/page/create_cv/reference/reference_add_widget.dart';
import 'package:try_auth_suba/page/create_cv/skills/skill.dart';
import 'package:try_auth_suba/page/create_cv/skills/skills_add_widget.dart';


class CVInsertScreen extends StatefulWidget {
  @override
  _CVInsertScreenState createState() => _CVInsertScreenState();
}

class _CVInsertScreenState extends State<CVInsertScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController summaryController = TextEditingController();
  final TextEditingController skillsController = TextEditingController();
  final TextEditingController languagesController = TextEditingController();
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController gitLink = TextEditingController();
  final TextEditingController linkedLink = TextEditingController();
  final TextEditingController interests = TextEditingController();

  final List<Education> educationList = [];
  final List<Certification> certificationList = [];
  final List<Experience> experienceList = [];
  final List<Project> projectList = [];
  final List<Reference> referenceList = [];
  final List<String> skillsList = [];
  final List<String> languagesList = [];

  final Serves serves = Serves();
  void removeFromList(List<dynamic> list, int index) {
    setState(() {
      list.removeAt(index);
    });
  }

  void addEducation() async {
    final TextEditingController degree = TextEditingController();
    final TextEditingController institution = TextEditingController();
    final TextEditingController field = TextEditingController();
    final TextEditingController start = TextEditingController();
    final TextEditingController end = TextEditingController();
    await showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return EduWidget(
            degree: degree,
            institution: institution,
            field: field,
            start: start,
            end: end,
            educationList: educationList);
      },
    );
    setState(() {});
  }

  void addCertification() async {
    final TextEditingController data = TextEditingController();
    final TextEditingController descriprion = TextEditingController();
    final TextEditingController title = TextEditingController();
    final TextEditingController organization = TextEditingController();
    await showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return CertificationWidget(
            data: data,
            descriprion: descriprion,
            organization: organization,
            title: title,
            certificationList: certificationList);
      },
    );
    setState(() {});
  }

  void addProject() async {
    final TextEditingController title = TextEditingController();
    final TextEditingController description = TextEditingController();
    final TextEditingController start = TextEditingController();
    final TextEditingController end = TextEditingController();
    await showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return ProjectWidget(
            title: title,
            description: description,
            start: start,
            end: end,
            projectList: projectList);
      },
    );
    setState(() {});
  }

  void addReference() async {
    final TextEditingController companyRf = TextEditingController();
    final TextEditingController emailRf = TextEditingController();
    final TextEditingController nameRf = TextEditingController();
    final TextEditingController phoneRf = TextEditingController();
    final TextEditingController positionRf = TextEditingController();

    await showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return ReferenceWidget(
            companyRf: companyRf,
            emailRf: emailRf,
            nameRf: nameRf,
            phoneRf: phoneRf,
            positionRf: positionRf,
            referenceList: referenceList);
      },
    );
    setState(() {});
  }

  void addExperience() async {
    final TextEditingController company = TextEditingController();
    final TextEditingController description = TextEditingController();
    final TextEditingController position = TextEditingController();
    final TextEditingController start = TextEditingController();
    final TextEditingController end = TextEditingController();
    await showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return ExperienceWidget(
            company: company,
            description: description,
            position: position,
            start: start,
            end: end,
            experienceList: experienceList);
      },
    );
    setState(() {});
  }

  void addSkill() async {
    final TextEditingController skill = TextEditingController();

    await showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SkillsWidget(skill: skill, skillsList: skillsList);
      },
    );
    setState(() {});
  }

  void addLanguage() async {
    final TextEditingController language = TextEditingController();

    await showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return LanguageWidget(language: language, languagesList: languagesList);
      },
    );
    setState(() {});
  }

  void insertCV() {
    if (nameController.text.isEmpty || addressController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    CV cv = CV(
        references: referenceList,
        name: nameController.text,
        address: addressController.text,
        phone: phoneController.text,
        email: emailController.text,
        summary: summaryController.text,
        skills: skillsList,
        languages: languagesList,
        userId: userIdController.text?? "21db49ba-c9e8-4348-8933-2a4c7a7bdaa5",
        certifications: certificationList,
        experiences: experienceList,
        projects: projectList,
        educations: educationList,
        githubLink: gitLink.text,
        linkedInLink: linkedLink.text,
        interests: interests.text);

    serves.insertCv(cv);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('CV inserted successfully')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert CV'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: summaryController,
              decoration: const InputDecoration(labelText: 'Summary'),
            ),
            TextField(
              controller: linkedLink,
              decoration: const InputDecoration(labelText: 'linked In Link'),
            ),
            TextField(
              controller: gitLink,
              decoration: const InputDecoration(labelText: 'git hub link'),
            ),
            TextField(
              controller: interests,
              decoration: const InputDecoration(labelText: 'interests'),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Education',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Column(
              children: [
                for (int index = 0; index < educationList.length; index++)
                  EducationEntryWidget(
                    education: educationList[index],
                    onDelete: (education) =>
                        removeFromList(educationList, index),
                  ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: addEducation,
                  child: const Text('Add Education'),
                ),
              ],
            ),
            const Text(
              'Certification',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                for (int index = 0; index < certificationList.length; index++)
                  CertificationEntryWidget(
                    certification: certificationList[index],
                    onDelete: (certification) =>
                        removeFromList(certificationList, index),
                  ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: addCertification,
                  child: const Text('Add certification'),
                ),
              ],
            ),
            const Text(
              'projects',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                for (int index = 0; index < projectList.length; index++)
                  ProjectEntryWidget(
                    project: projectList[index],
                    onDelete: (project) => removeFromList(projectList, index),
                  ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: addProject,
                  child: const Text('Add project'),
                ),
              ],
            ),
            const Text(
              'reference',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                for (int index = 0; index < referenceList.length; index++)
                  ReferenceEntryWidget(
                    reference: referenceList[index],
                    onDelete: (reference) =>
                        removeFromList(referenceList, index),
                  ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: addReference,
                  child: const Text('Add reference'),
                ),
              ],
            ),
            const Text(
              'experience',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                for (int index = 0; index < experienceList.length; index++)
                  ExperienceEntryWidget(
                    experience: experienceList[index],
                    onDelete: (experience) =>
                        removeFromList(experienceList, index),
                  ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: addExperience,
                  child: const Text('Add experience'),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Skills',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                for (int index = 0; index < skillsList.length; index++)
                  SkillEntryWidget(
                    skill: skillsList[index],
                    onDelete: (skill) => removeFromList(skillsList, index),
                  ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: addSkill,
                  child: const Text('Add Skill'),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Languages',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                for (int index = 0; index < languagesList.length; index++)
                  LanguageEntryWidget(
                    language: languagesList[index],
                    onDelete: (language) =>
                        removeFromList(languagesList, index),
                  ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: addLanguage,
                  child: const Text('Add Language'),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: insertCV,
              child: const Text('Insert CV'),
            ),
          ],
        ),
      ),
    );
  }
}
