// 
import 'package:flutter/material.dart';
import 'package:try_auth_suba/model/education.dart';

class EducationEntryWidget extends StatelessWidget {
  final Education education;
  final void Function(Education education) onDelete;

  const EducationEntryWidget({
    required this.education,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        title: Text(education.degree),
        subtitle: Text('${education.institution} - ${education.startDate} to ${education.endDate}'),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () => onDelete(education),
        ),
      ),
    );
  }
}
