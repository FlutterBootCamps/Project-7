import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project7/bloc/bloc/bloc/creatcv_bloc.dart';
import 'package:project7/helper/colors.dart';
import 'package:project7/model/user_data.dart';
import 'package:project7/widgets/card_widget.dart';

import '../widgets/textfiled_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController dateOfBirthController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController abstractController = TextEditingController();
    final TextEditingController educationController = TextEditingController();
    final TextEditingController dateEducationController = TextEditingController();
    final TextEditingController workExperienceController =TextEditingController();
    final TextEditingController dateWorkExperienceController =TextEditingController();
    final TextEditingController skillsController = TextEditingController();
    final TextEditingController languagesController = TextEditingController();

    return Scaffold(
      backgroundColor: beige,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 400,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "images/backgroun.png"), // Background image for the header
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            colors: [
                              Colors.black.withOpacity(.9),
                              Colors.black.withOpacity(.4),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      bottom: 15,
                      left: 10,
                      right: 0,
                      child: Text(
                        " Your CV's",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                  ],
                ),
                CardWidget(),
              ],
            ),
          )),
          //  BlocBuilder<CreatcvBloc, CreatcvState>(
          //         builder: (context, state) {
          //   if (state is DisplayInfoState){
          //      return CardWidget(cvInfo: state.user,);
          //   }
          //   else{
          //     return Center(child: const Text("Error"));
          //   }

          //         },
          //       ),
           
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show a bottom sheet to add a new product
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 450,
                color: Colors.white,
                child: Center(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            // Text fields for entering Cv details
                            Textfield2Widget(
                                controller: nameController, label: 'Full Name'),
                            Textfield2Widget(
                                controller: phoneController, label: 'Phone'),
                            Textfield2Widget(
                                controller: emailController, label: 'email'),
                            Textfield2Widget(
                                controller: dateOfBirthController,
                                label: 'Date of Birth'),
                            Textfield2Widget(
                                controller: cityController, label: 'City'),
                            Textfield2Widget(
                              controller: abstractController,
                              label: 'Abstract',
                              max: 5,
                              min: 2,
                            ),
                            Textfield2Widget(
                                controller: educationController,
                                label: 'Education'),
                            Textfield2Widget(
                                controller: dateEducationController,
                                label: 'Date Education'),
                            Textfield2Widget(
                                controller: workExperienceController,
                                label: 'Work Experience'),
                            Textfield2Widget(
                                controller: dateWorkExperienceController,
                                label: 'Date Work Experience'),
                            Textfield2Widget(
                                controller: skillsController, label: 'Skills'),
                            Textfield2Widget(
                                controller: languagesController,
                                label: 'Languages'),
                            // Button to create a new CV
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          foregroundColor: white,
                          backgroundColor: dark,
                        ),
                        child: const Text('Create'),
                        onPressed: () {
                          BlocProvider.of<CreatcvBloc>(context).add(
                            CreateInfoEvent(
                                cv: UserDataModel(
                                    fullName: nameController.text,
                                    phone: phoneController.text,
                                    email: emailController.text,
                                    dateOfBirth: dateOfBirthController.text,
                                    city: cityController.text,
                                    abstract: abstractController.text,
                                    education: educationController.text,
                                    dateEducation: dateEducationController.text,
                                    workExperience:
                                        workExperienceController.text,
                                    dateWorkExperience:
                                        dateWorkExperienceController.text,
                                    skills: skillsController.text,
                                    languages: languagesController.text)),
                          );
                          BlocProvider.of<CreatcvBloc>(context).add(
                            FetchDataEvent(),
                          );

                          Navigator.pop(context); // Close the bottom sheet
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: white,
        child: const Icon(
          Icons.add,
          color: dark,
        ),
      ),
    );
  }
}
