
import 'package:flutter/material.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({
    super.key,
    required this.language,
    required this.languagesList,
  });

  final TextEditingController language;
  final List<String> languagesList;

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
                  hintText: "Language",
                ),
                controller: language,
              ),
              ElevatedButton(
                child: const Text('Add'),
                onPressed: () {
                  if (language.text.isNotEmpty) {
                    languagesList.add(language.text);
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
