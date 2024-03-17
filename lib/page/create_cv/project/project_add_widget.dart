
import 'package:flutter/material.dart';
import 'package:try_auth_suba/model/Project.dart';

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({
    super.key,
    required this.title,
    required this.description,
    required this.start,
    required this.end,
    required this.projectList,
  });

  final TextEditingController title;
  final TextEditingController description;
  final TextEditingController start;
  final TextEditingController end;
  final List<Project> projectList;

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
                      hintText: "title"),
                  controller: title),
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
                  if (title.text.isNotEmpty) {
                    projectList.add(Project(
                        title: title.text,
                        description: description.text,
                        startDate: start.text,
                        endDate: end.text));
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
