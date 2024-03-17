import 'package:flutter/material.dart';
import 'package:try_auth_suba/model/certification.dart';

class CertificationEntryWidget extends StatelessWidget {
  final Certification certification;
  final Function(Certification) onDelete;

  CertificationEntryWidget({
    required this.certification,
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
            Text('title: ${certification.title}'),
            Text('description: ${certification.description}'),
            Text('organization: ${certification.organization}'),
            Text('Date: ${certification.date}'),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => onDelete(certification),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
