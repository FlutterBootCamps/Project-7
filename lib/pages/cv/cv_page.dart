import 'package:cv_app/extension/colors.dart';
import 'package:cv_app/models/cv_model.dart';
import 'package:cv_app/pages/dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';

class CvPage extends StatelessWidget {
  CvPage({super.key, required this.resume});
  CvModel resume;

  @override
  Widget build(BuildContext context) {
    TemplateData templateData = TemplateData(
        fullName: resume.name,
        email: resume.email,
        phoneNumber: resume.phoneNumber,
        bio: resume.bio,
        experience: [
          ExperienceData(
            experienceTitle: resume.experienceTitle,
            experienceLocation: resume.experienceLocation,
            experiencePeriod: resume.experiencePeriod,
            experiencePlace: resume.experiencePlace,
            experienceDescription: resume.experienceDescription,
          ),
          // ExperienceData(
          //   experienceTitle: 'Product Design',
          //   experienceLocation: 'Uk . London',
          //   experiencePeriod: 'Aug 2021 - Dec 2023',
          //   experiencePlace: 'London',
          //   experienceDescription: workExperienceCompany2,
          // ),
          // ExperienceData(
          //   experienceTitle: 'Flutter Developer',
          //   experienceLocation: 'Uk . London',
          //   experiencePeriod: 'Aug 2021 - Dec 2023',
          //   experiencePlace: 'London',
          //   experienceDescription: workExperienceCompany3,
          // ),
        ],
        educationDetails: [
          Education('Bachelor Degree', 'Oxford University'),
          Education('', ''),
          // Education(resume.schoolLevel, resume.schoolName),
        ],
        languages: [
          Language(resume.language, resume.level

           ),
        ],
        hobbies: [
  resume.hobbies
        ],
        image:
            'https://images.pexels.com/photos/3768911/pexels-photo-3768911.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        backgroundImage:
            'https://images.pexels.com/photos/3768911/pexels-photo-3768911.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(title: Text("Your Cv",style: TextStyle(fontWeight: FontWeight.bold),),),
      // floatingActionButton: ElevatedButton(
      //   child: const Text("new resume"),
      //   onPressed: () {},
      // ),
      body:

          // child: Column(
          //   children: [
          //     Row(
          //       children: [
          //         Container(
          //           width: MediaQuery.of(context).size.width * 0.3,
          //           height: MediaQuery.of(context).size.height * 0.7,
          //           decoration: BoxDecoration(color: purbleColor),
          //           child: Column(
          //               children: [
          //                 Image.asset('assets/images/person.jpeg')]),
          //         )
          //       ],
          //     )
          //   ],
          // )
          SafeArea(

        child: FlutterResumeTemplate(
          data: templateData,
          templateTheme: TemplateTheme.modern,
          mode: TemplateMode.readOnlyMode,
          onSaveResume: (globalKey) async =>
              await PdfHandler().createResume(globalKey),
        ),
      ),
    );
  }
}
