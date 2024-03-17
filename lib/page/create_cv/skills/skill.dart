 import 'package:flutter/material.dart';
import 'package:try_auth_suba/model/education.dart';

class SkillEntryWidget extends StatelessWidget {
  final String skill;
  final void Function(String skill) onDelete;

  const SkillEntryWidget({
    required this.skill,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text("skill : $skill")
    );
  }
}
