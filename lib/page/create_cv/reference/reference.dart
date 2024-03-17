import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:try_auth_suba/model/education.dart';
import 'package:try_auth_suba/model/references.dart';

class ReferenceEntryWidget extends StatelessWidget {
  final Reference reference;
  final Function(Reference) onDelete;

  ReferenceEntryWidget({
    required this.reference,
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
            Text('Institution: ${reference.name}'),
            Text('Degree: ${reference.email}'),
            Text('Field of Study: ${reference.phone}'),
            Text('Start Date: ${reference.position}'),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => onDelete(reference),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}