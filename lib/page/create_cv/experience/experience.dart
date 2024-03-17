// 
import 'package:flutter/material.dart';
import 'package:try_auth_suba/model/education.dart';
import 'package:try_auth_suba/model/experience.dart';

class ExperienceEntryWidget extends StatelessWidget {
  final Experience experience;
  final void Function(Experience education) onDelete;

  const ExperienceEntryWidget({
    required this.experience,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        title: Text(experience.position),
        subtitle: Text('${experience.company} - ${experience.startDate} to ${experience.endDate}'),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () => onDelete(experience),
        ),
      ),
    );
  }
}
