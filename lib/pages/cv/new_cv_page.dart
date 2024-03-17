import 'package:cv_app/extension/colors.dart';
import 'package:cv_app/extension/spase.dart';
import 'package:cv_app/models/cv_model.dart';
import 'package:cv_app/pages/cv/cv_page.dart';
import 'package:cv_app/pages/previus_cv/bloc/previus_cv_bloc.dart';
import 'package:cv_app/widgets/purble_elevated_button.dart';
import 'package:cv_app/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/data_service.dart';
import '../../services/setup.dart';

class NewCvPage extends StatelessWidget {
  NewCvPage({super.key, this.cvModel});
  CvModel? cvModel;

  @override
  Widget build(BuildContext context) {
    TextEditingController fullNameController =
        TextEditingController(text: cvModel?.name);
    TextEditingController emailController =
        TextEditingController(text: cvModel?.email);
    TextEditingController phoneController =
        TextEditingController(text: cvModel?.phoneNumber);
    TextEditingController experienceController =
        TextEditingController(text: cvModel?.workExperience);
    TextEditingController skillsConrtoller =
        TextEditingController(text: cvModel?.skills);
    TextEditingController bioController =
        TextEditingController(text: cvModel?.bio);
    TextEditingController titleController =
        TextEditingController(text: cvModel?.experienceTitle);
    TextEditingController placeeController =
        TextEditingController(text: cvModel?.experiencePlace);
    TextEditingController periodController =
        TextEditingController(text: cvModel?.experiencePeriod);
    TextEditingController locationController =
        TextEditingController(text: cvModel?.experienceLocation);
    TextEditingController descriptionController =
        TextEditingController(text: cvModel?.experienceDescription);
    TextEditingController educationdegreeController =
        TextEditingController(text: cvModel?.schoolLevel);
    TextEditingController educationplaceController =
        TextEditingController(text: cvModel?.schoolName);
    TextEditingController languageController =
        TextEditingController(text: cvModel?.language);
    TextEditingController levelController =
        TextEditingController(text: cvModel?.level.toString());
    TextEditingController hoppiesController =
        TextEditingController(text: cvModel?.hobbies);
    final servicelocater = DataInjection().locater.get<DataBase>();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Text(
          "CV Initiator",
          style: GoogleFonts.caveat(fontSize: 25, fontWeight: FontWeight.w800),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    ExpansionTile(
                      initiallyExpanded: true,
                      title: const Text("Personal Information"),
                      subtitle: Text(
                        "Enter your personal information",
                        style: TextStyle(color: greyColor),
                      ),
                      children: [
                        TextFieldWidget(
                          controller: fullNameController,
                          label: "Full Name",
                          hintText: "Maram Alharthi",
                        ),
                        sizedBox15,
                        TextFieldWidget(
                          controller: emailController,
                          label: "Email",
                          hintText: "Maram@gmail.com",
                        ),
                        sizedBox15,
                        TextFieldWidget(
                          controller: phoneController,
                          label: "Phone Number",
                          hintText: "0547211547",
                        ),
                        sizedBox15,
                        TextFieldWidget(
                          controller: bioController,
                          label: "Bio",
                          hintText: "Bio",
                        ),
                        sizedBox10
                      ],
                    ),
                    sizedBox20,
                    ExpansionTile(
                      title: const Text("Education"),
                      subtitle: Text(
                        "Enter your Education information",
                        style: TextStyle(color: greyColor),
                      ),
                      children: [
                        TextFieldWidget(
                          controller: educationdegreeController,
                          label: "Education degree",
                          hintText: "Education degree",
                        ),
                        sizedBox10,
                        TextFieldWidget(
                          controller: educationplaceController,
                          label: "Education Place",
                          hintText: "Education Place",
                        ),
                        sizedBox10
                      ],
                    ),
                    sizedBox20,
                    ExpansionTile(
                      title: const Text("Experience"),
                      subtitle: Text(
                        "Enter your Experience information",
                        style: TextStyle(color: greyColor),
                      ),
                      children: [
                        TextFieldWidget(
                          controller: titleController,
                          label: "Title",
                          hintText: "Title",
                        ),
                        sizedBox10,
                        TextFieldWidget(
                          controller: placeeController,
                          label: "Place",
                          hintText: "Place",
                        ),
                        sizedBox10,
                        TextFieldWidget(
                          controller: periodController,
                          label: "Period",
                          hintText: "Period",
                        ),
                        sizedBox10,
                        TextFieldWidget(
                          controller: locationController,
                          label: "Location",
                          hintText: "Location",
                        ),
                        sizedBox10,
                        TextFieldWidget(
                          controller: descriptionController,
                          label: "Description",
                          hintText: "Description",
                        ),
                        sizedBox10
                      ],
                    ),
                    ExpansionTile(
                      title: const Text("Skills"),
                      subtitle: Text(
                        "Enter your Skills",
                        style: TextStyle(color: greyColor),
                      ),
                      children: [
                        TextFieldWidget(
                          controller: skillsConrtoller,
                          label: "Skills",
                          hintText: "Skills",
                        ),
                        sizedBox10
                      ],
                    ),
                    ExpansionTile(
                      title: const Text("Language"),
                      subtitle: Text(
                        "Enter your Language",
                        style: TextStyle(color: greyColor),
                      ),
                      children: [
                        TextFieldWidget(
                          controller: languageController,
                          label: "Language",
                          hintText: "Language",
                        ),
                        sizedBox10,
                        TextFieldWidget(
                          controller: levelController,
                          label: "Level",
                          hintText: "Level",
                        ),
                        sizedBox10
                      ],
                    ),
                    ExpansionTile(
                      title: const Text("Hoppies"),
                      subtitle: Text(
                        "Enter your Hoppies",
                        style: TextStyle(color: greyColor),
                      ),
                      children: [
                        TextFieldWidget(
                          controller: hoppiesController,
                          label: "Hoppies",
                          hintText: "Hoppies",
                        ),
                        sizedBox10,
                      ],
                    ),
                    PurbleElevatedButton(
                        text: "Save",
                        onPressed: () async {
                          if (cvModel == null) {
                            CvModel cv = CvModel(
                                user_id: servicelocater.userId,
                                name: fullNameController.text,
                                email: emailController.text,
                                phoneNumber: phoneController.text,
                                workExperience: experienceController.text,
                                skills: skillsConrtoller.text,
                                bio: bioController.text,
                                experienceTitle: titleController.text,
                                experienceDescription:
                                    descriptionController.text,
                                experienceLocation: locationController.text,
                                experiencePeriod: periodController.text,
                                experiencePlace: placeeController.text,
                                schoolLevel: educationdegreeController.text,
                                schoolName: educationplaceController.text,
                                language: languageController.text,
                                level: int.parse(levelController.text),
                                hobbies: hoppiesController.text);
                            await servicelocater.addToSupabase(cv);
                            BlocProvider.of<PreviusCvBloc>(context)
                                .add(FetchPreviusEvent());
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CvPage(
                                        resume: cv,
                                      )),
                            );
                          } else {
                            CvModel cv = CvModel(
                                id: cvModel?.id,
                                user_id: servicelocater.userId,
                                name: fullNameController.text,
                                email: emailController.text,
                                phoneNumber: phoneController.text,
                                workExperience: experienceController.text,
                                skills: skillsConrtoller.text,
                                bio: bioController.text,
                                experienceTitle: titleController.text,
                                experienceDescription:
                                    descriptionController.text,
                                experienceLocation: locationController.text,
                                experiencePeriod: periodController.text,
                                experiencePlace: placeeController.text,
                                schoolLevel: educationdegreeController.text,
                                schoolName: educationplaceController.text,
                                language: languageController.text,
                                level: int.parse(levelController.text),
                                hobbies: hoppiesController.text);
                            await servicelocater.updateCV(cv);
                            BlocProvider.of<PreviusCvBloc>(context)
                                .add(FetchPreviusEvent());
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CvPage(
                                        resume: cv,
                                      )),
                            );
                          }
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
