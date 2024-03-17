import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project7/core/utils/const_style.dart';
import 'package:project7/views/Edit-Screen/bloc/edit_bloc.dart';
import 'package:project7/views/widgets/nav_bottom.dart';

class EditCvScreen extends StatelessWidget {
  EditCvScreen({super.key});
  TextEditingController namecontroller = TextEditingController();
  TextEditingController summarycontroller = TextEditingController();
  TextEditingController Educationcontroller = TextEditingController();
  TextEditingController Experiencecontroller = TextEditingController();
  TextEditingController Skillscontroller = TextEditingController();
  TextEditingController Languagescontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/blue.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white54),
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 1,
                child: ListView(
                  children: [
                    TextField(
                      minLines: 1,
                      maxLines: 1,
                      maxLength: 15,
                      controller: namecontroller,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          hintText: "name",
                          hintStyle: viewUserStyle,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)))),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      maxLines: 10,
                      maxLength: 500,
                      minLines: 4,
                      controller: summarycontroller,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          hintText: "summary",
                          hintStyle: viewUserStyle,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)))),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      maxLines: 5,
                      maxLength: 200,
                      minLines: 2,
                      controller: Educationcontroller,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          hintText: "Education",
                          hintStyle: viewUserStyle,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)))),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      maxLines: 10,
                      maxLength: 300,
                      minLines: 2,
                      controller: Experiencecontroller,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          hintText: "Experience",
                          hintStyle: viewUserStyle,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)))),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      maxLines: 20,
                      minLines: 2,
                      maxLength: 200,
                      controller: Skillscontroller,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          hintText: "Skills",
                          hintStyle: viewUserStyle,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)))),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      maxLines: 7,
                      maxLength: 200,
                      minLines: 2,
                      controller: Languagescontroller,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          hintText: "Languages",
                          hintStyle: viewUserStyle,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)))),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Colors.lightBlue.withOpacity(0.5)),
                  elevation: MaterialStateProperty.all(8),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24)),
                  textStyle: MaterialStateProperty.all(const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
                ),
                onPressed: () {
                  BlocProvider.of<EditBloc>(context).add(
                    EditDataEvent(
                      name: namecontroller.text,
                      summary: summarycontroller.text,
                      education: Educationcontroller.text,
                      experience: Experiencecontroller.text,
                      skills: Skillscontroller.text,
                      languages: Languagescontroller.text,
                    ),
                  );
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>NavBottomBar()),(route) => false,);
                     
                },
                child: const Text(
                  'Edit Your CV',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
