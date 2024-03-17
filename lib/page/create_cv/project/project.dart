import 'package:flutter/material.dart';
import 'package:try_auth_suba/model/Project.dart';
import 'package:try_auth_suba/model/education.dart';

class ProjectEntryWidget extends StatelessWidget {
  final Project project;
  final Function(Project) onDelete;

  ProjectEntryWidget({
    required this.project,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Institution: ${project.title}'),
            Text('Degree: ${project.description}'),
            Text('Start Date: ${project.startDate}'),
            Text('End Date: ${project.endDate}'),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => onDelete(project),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}