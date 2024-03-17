 import 'package:flutter/material.dart';
import 'package:try_auth_suba/model/education.dart';

class LanguageEntryWidget extends StatelessWidget {
  final String language;
  final void Function(String language) onDelete;

  const LanguageEntryWidget({
    required this.language,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text("language : $language")
    );
  }
}
