import 'package:cv_creator_app/bloc/cv_bloc.dart';
import 'package:cv_creator_app/constrans/color.dart';
import 'package:cv_creator_app/constrans/space.dart';
import 'package:cv_creator_app/helper/screen_helper.dart';
import 'package:cv_creator_app/layers/data_layer.dart';
import 'package:cv_creator_app/models/cv_model.dart';
import 'package:cv_creator_app/screens/user_cv_screen.dart';
import 'package:cv_creator_app/widgets/eduction_field_widget.dart';
import 'package:cv_creator_app/widgets/experience_field_widget.dart';
import 'package:cv_creator_app/widgets/project-field_widget.dart';
import 'package:cv_creator_app/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class AddCVScreen extends StatelessWidget {
  AddCVScreen({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController skillController = TextEditingController();
  TextEditingController skillController1 = TextEditingController();
  TextEditingController skillController2 = TextEditingController();
  TextEditingController majorController = TextEditingController();
  TextEditingController universityController = TextEditingController();
  TextEditingController startDateEduController = TextEditingController();
  TextEditingController endDateEduController = TextEditingController();
  TextEditingController eductionController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController startDateExpController = TextEditingController();
  TextEditingController endDateExpController = TextEditingController();
  TextEditingController projectTitleController = TextEditingController();
  TextEditingController projectDescriptionController = TextEditingController();
  TextEditingController referenceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final locator = GetIt.I.get<DataService>();

    DateTime selectedDate = DateTime.now();
    final DateFormat formatter = DateFormat('MM-yyy-dd');

    final bloc = context.read<CvBloc>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkGreen,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: white,
              size: 25,
            ),
            onPressed: () {
              context.pushTo(view: const UserCVScreen());
            }),
        actions: [
          InkWell(
            onTap: () {
              print("press add");
              if (nameController.text.isNotEmpty &&
                      emailController.text.isNotEmpty &&
                      phoneController.text.isNotEmpty &&
                      locationController.text.isNotEmpty
                  ) {
                bloc.add(AddNewCVEvent(
                  cv: CVModel(
                      name: nameController.text,
                      email: emailController.text,
                      phone: phoneController.text,
                      educations: Educations(
                          major: majorController.text,
                          endDate: endDateEduController.text,
                          startDate: startDateEduController.text,
                          university: universityController.text),
                      projects: Projects(
                          projectTitle: projectTitleController.text,
                          projectDescription:
                              projectDescriptionController.text),
                      skills: Skills(
                        skillTitle: skillController.text,
                        skillTitle1: skillController1.text,
                        skillTitle2: skillController2.text,
                      ),
                      experiences: Experiences(
                          endDate: endDateExpController.text,
                          position: positionController.text,
                          startdate: startDateExpController.text,
                          companyName: companyController.text,
                          description: descriptionController.text),
                      references: referenceController.text,
                      location: locationController.text),
                  //  userCV
                ));
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const UserCVScreen()),
                    (route) => false);
                print("after press add");
              }
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 24, top: 12.0, bottom: 12),
              child: Text(
                "Save",
                style: TextStyle(
                    color: white, fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Personal Information",
                        style: TextStyle(
                            color: darkGreen,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  TextFieldWidget(
                    controller: nameController,
                    hintText: "Enter your Name",
                    icon: const Icon(
                      Icons.person,
                      color: darkGreen,
                    ),
                  ),
                  TextFieldWidget(
                    controller: emailController,
                    hintText: "Enter your Email",
                    icon: const Icon(
                      Icons.email_outlined,
                      color: darkGreen,
                    ),
                  ),
                  TextFieldWidget(
                    controller: phoneController,
                    hintText: "Enter your Phone ",
                    icon: const Icon(
                      Icons.phone,
                      color: darkGreen,
                    ),
                  ),
                  TextFieldWidget(
                    controller: locationController,
                    hintText: "Enter your Location ",
                    icon: const Icon(
                      Icons.location_on_outlined,
                      color: darkGreen,
                    ),
                  ),

                  // Add Education field
                  height12,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Education",
                        style: TextStyle(
                            color: darkGreen,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),

                  EductionFieldWidget(
                    cv: locator.userCV,
                    majorController: majorController,
                    universityController: universityController,
                    startDateController: startDateEduController,
                    endDateController: endDateEduController,
                  ),

                  // ----  Add Experience Field ---
                  height12,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Experiences",
                        style: TextStyle(
                            color: darkGreen,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  ExperienceFieldWidget(
                    cv: locator.userCV,
                    positionController: positionController,
                    companyController: companyController,
                    descriptionController: descriptionController,
                    startDateController: startDateExpController,
                    endDateController: endDateExpController,
                  ),

                  // Add project field
                  height12,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Project",
                        style: TextStyle(
                            color: darkGreen,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  ProjectFieldWidget(
                    cv: locator.userCV,
                    // index: index,
                    titleHintText: "Enter your project title",
                    titleController: projectTitleController,
                    descriptionHintText: "Enter your project description",
                    descriptionController: projectDescriptionController,
                    icon: const Icon(
                      Icons.lightbulb_circle_rounded,
                      color: darkGreen,
                    ),
                  ),

                  //  Add Reference Field
                  height12,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "References",
                        style: TextStyle(
                            color: darkGreen,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  TextFieldWidget(
                    controller: referenceController,
                    hintText: "Enter your Reference",
                    icon: const Icon(Icons.card_travel_rounded),
                  ),

                  // Add skill field
                  height12,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Skills",
                        style: TextStyle(
                            color: darkGreen,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  TextFieldWidget(
                    controller: skillController, //!
                    hintText: "Enter your Skill",
                    icon: const Icon(Icons.lightbulb_circle_rounded),
                  ),
                  TextFieldWidget(
                    controller: skillController1,
                    hintText: "Enter your Skill",
                    icon: const Icon(Icons.lightbulb_circle_rounded),
                  ),
                  TextFieldWidget(
                    controller: skillController2,
                    hintText: "Enter your Skill",
                    icon: const Icon(Icons.lightbulb_circle_rounded),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
