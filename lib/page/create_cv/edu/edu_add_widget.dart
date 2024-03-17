
import 'package:flutter/material.dart';
import 'package:try_auth_suba/model/education.dart';

class EduWidget extends StatelessWidget {
  const EduWidget({
    super.key,
    required this.degree,
    required this.institution,
    required this.field,
    required this.start,
    required this.end,
    required this.educationList,
  });

  final TextEditingController degree;
  final TextEditingController institution;
  final TextEditingController field;
  final TextEditingController start;
  final TextEditingController end;
  final List<Education> educationList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: Colors.blueGrey.shade300,
      child: Center(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "degree"),
                  controller: degree),
              TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "institution"),
                  controller: institution),
              TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "field"),
                  controller: field),
              TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "start date"),
                  controller: start),
              TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "end date"),
                  controller: end),
              ElevatedButton(
                child: const Text('add'),
                onPressed: () {
                  if (degree.text.isNotEmpty) {
                    Education object = Education(
                        degree: degree.text,
                        fieldOfStudy: field.text,
                        startDate: start.text,
                        endDate: end.text,
                        institution: institution.text);
                    educationList.add(object);
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
