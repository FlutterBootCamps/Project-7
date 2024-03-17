
import 'package:flutter/material.dart';
import 'package:try_auth_suba/model/experience.dart';

class ExperienceWidget extends StatelessWidget {
  const ExperienceWidget({
    super.key,
    required this.company,
    required this.description,
    required this.position,
    required this.start,
    required this.end,
    required this.experienceList,
  });

  final TextEditingController company;
  final TextEditingController description;
  final TextEditingController position;
  final TextEditingController start;
  final TextEditingController end;
  final List<Experience> experienceList;

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
                      hintText: "company"),
                  controller: company),
              TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "description"),
                  controller: description),
              TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "position"),
                  controller: position),
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
                  if (company.text.isNotEmpty) {
                    Experience object = Experience(
                        company: company.text,
                        description: description.text,
                        startDate: start.text,
                        endDate: end.text,
                        position: position.text);
                    experienceList.add(object);
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
