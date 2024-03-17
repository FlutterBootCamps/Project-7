import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project8/bloc/cv_bloc.dart';
import 'package:project8/model/cv_model.dart';
import 'package:project8/view/cv_page.dart';
import 'package:project8/view/tamplet_page.dart';
import 'package:project8/widgets/text_widget.dart';
import 'package:project8/widgets/textfield_number.dart';
import 'package:project8/widgets/textfieldwedget2.dart';

class PersonalPage extends StatelessWidget {
  PersonalPage({super.key});
   final TextEditingController firstController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController portfolioController = TextEditingController();
  final TextEditingController objectiveController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController studyProgramController = TextEditingController();
  final TextEditingController placeEducationController = TextEditingController();
  final TextEditingController gpaController = TextEditingController();
  final TextEditingController projectNameController = TextEditingController();
  final TextEditingController projectDescriptionController =
      TextEditingController();
  final TextEditingController skillsController = TextEditingController();
  final TextEditingController organizationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff3f1ee),
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromARGB(255, 173, 27, 27), width: 5)),
            child: ListView(
              children: [
                 const Textwidget(text: 'First Name',),
                TextfieldWidget2(
                  labelText: 'First Name',
                  controller: firstController,
                ),
                const Textwidget(text: 'Last Name',),
                TextfieldWidget2(
                  labelText: 'Last Name',
                  controller: lastnameController,
                ),
                const Textwidget(text: 'Profession',),
                TextfieldWidget2(
                  labelText: 'Profession',
                  controller: professionController,
                ),
                const Textwidget(text: 'Email',),
                TextfieldWidget2(
                  labelText: 'Email',
                  controller: emailController,
                ),
                const Textwidget(text: 'Phone Number',),
                TextfieldNumber(
                  labelText: 'Phone Number',
                  controller: phoneController,
                ),
                const Textwidget(text: 'Country',),
                TextfieldWidget2(
                  labelText: 'Country',
                  controller: countryController,
                ),
                const Textwidget(text: 'City',),
                TextfieldWidget2(
                  labelText: 'City',
                  controller: cityController,
                ),
                const Textwidget(text: 'Address',),
                TextfieldWidget2(
                  labelText: 'Address',
                  controller: addressController,
                ),
                const Textwidget(text: 'Portfolio',),
                TextfieldWidget2(
                  labelText: 'Portfolio',
                  controller: portfolioController,
                ),
                 const Textwidget(text: 'Objective',),
                TextfieldMultiline(
                  labelText: 'Objective',
                  controller: objectiveController,
                ),
                 const Textwidget(text: 'Position',),
                TextfieldWidget2(
                  labelText: 'Position',
                  controller: positionController,
                ),
                 const Textwidget(text: 'Company',),
                TextfieldWidget2(
                  labelText: 'Company',
                  controller: companyController,
                ),
                 const Textwidget(text: 'Study program',),
                TextfieldWidget2(
                  labelText: 'Study program',
                  controller: studyProgramController,
                ),
              const Textwidget(text: 'Place Education',),
                TextfieldWidget2(
                  labelText: 'Place Education',
                  controller: placeEducationController,
                ),
                 const Textwidget(text: 'GPA',),
                TextfieldNumber(
                  labelText: 'GPA',
                  controller: gpaController,
                ),
                 const Textwidget(text: 'Project Name',),
                TextfieldWidget2(
                  labelText: 'Project Name',
                  controller: projectNameController,
                ),
                const Textwidget(text: 'ProjectDescription',),
                TextfieldMultiline(
                  labelText: 'ProjectDescription',
                  controller: projectDescriptionController,
                ),
                 const Textwidget(text: 'Skills',),
                TextfieldMultiline(
                  labelText: 'Skills',
                  controller: skillsController,
                ),
                 const Textwidget(text: 'Organization',),
                TextfieldWidget2(
                  labelText: 'Organization',
                  controller: organizationController,
                ),
               ElevatedButton(
                onPressed: () {
                  final newCV = CV(
                    id: 0, // Assuming the ID will be generated by Supabase
                    first: firstController.text,
                    last: lastnameController.text,
                    profession: professionController.text,
                    email: emailController.text,
                    phone: int.parse(phoneController.text),
                    country: countryController.text,
                    city: cityController.text,
                    address: addressController.text,
                    portfolio: portfolioController.text,
                    objective: objectiveController.text,
                    position: positionController.text,
                    company: companyController.text,
                    studyProgram: studyProgramController.text,
                    placeEducation: placeEducationController.text,
                    gpa: double.parse(gpaController.text),
                    projectName: projectNameController.text,
                    projectDescription: projectDescriptionController.text,
                    skills: skillsController.text, // Assuming skills are comma-separated
                    organization: organizationController.text,
                    userid: '', // Update with actual user ID if needed
                  );
                   final bloc = context.read<CvBloc>();
                         bloc.add(AddEvent(newCV));
                          Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CVPage(newCV: newCV),
      ),
    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  child: const Text(
                    'Finish',
                    style: TextStyle(fontSize: 16, color: Color(0xffc5bbb9)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}


