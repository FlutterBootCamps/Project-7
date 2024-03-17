import 'package:cv_app/extension/colors.dart';
import 'package:cv_app/extension/spase.dart';
import 'package:cv_app/models/cv_model.dart';
import 'package:cv_app/pages/cv/cv_page.dart';
import 'package:cv_app/pages/cv/new_cv_page.dart';
import 'package:cv_app/pages/previus_cv/bloc/previus_cv_bloc.dart';
import 'package:cv_app/services/data_service.dart';
import 'package:cv_app/services/setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';

class ExploreCard extends StatelessWidget {
  ExploreCard({super.key, required this.resume, this.isEditable = false});

  CvModel resume;
  bool isEditable;
  @override
  Widget build(BuildContext context) {
    final servicelocater = DataInjection().locater.get<DataBase>();

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
          Language(resume.language, resume.level),
        ],
        hobbies: [resume.hobbies],
        image:
            'https://images.pexels.com/photos/3768911/pexels-photo-3768911.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        backgroundImage:
            'https://images.pexels.com/photos/3768911/pexels-photo-3768911.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => CvPage(resume: resume))),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        margin: const EdgeInsets.symmetric(vertical: 10),
        // height: 320,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: purbleColor,
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/person.jpeg')),
                  ),
                ),
                sizedBoxwidth10,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      resume.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      resume.schoolLevel,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ],
                ),
                const Spacer(),
                isEditable
                    ? IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      NewCvPage(
                                                        cvModel: resume,
                                                      )));
                                        },
                                        child: const Text("Edit"),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          await servicelocater.deleteCV(resume);
                                          BlocProvider.of<PreviusCvBloc>(
                                                  context)
                                              .add(FetchPreviusEvent());
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Delete",
                                          style: TextStyle(color: redColor),
                                        ),
                                      ),
                                      sizedBox30
                                    ],
                                  ),
                                );
                              });
                        },
                        icon: const Icon(Icons.more_vert))
                    : const SizedBox.shrink()
              ],
            ),
            sizedBox10,
            Container(
              width: 160,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: FlutterResumeTemplate(
                data: templateData,
                templateTheme: TemplateTheme.modern,
                mode: TemplateMode.readOnlyMode,
                onSaveResume: (globalKey) async =>
                    await PdfHandler().createResume(globalKey),
              ),
            ),
            Row(
              children: [
                const Icon(Icons.favorite_border_outlined),
                sizedBoxwidth10,
                const Text("Add to favorite")
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
