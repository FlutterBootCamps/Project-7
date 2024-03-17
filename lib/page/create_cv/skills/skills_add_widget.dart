
import 'package:flutter/material.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({
    super.key,
    required this.skill,
    required this.skillsList,
  });

  final TextEditingController skill;
  final List<String> skillsList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
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
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Skill",
                ),
                controller: skill,
              ),
              ElevatedButton(
                child: const Text('Add'),
                onPressed: () {
                  if (skill.text.isNotEmpty) {
                    skillsList.add(skill.text);
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
