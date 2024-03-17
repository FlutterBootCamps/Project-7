
import 'package:flutter/material.dart';

class EduWidget extends StatelessWidget {
  const EduWidget({
    super.key,
    required this.jsonListEdu,
    required this.edu,
  });

  final List jsonListEdu;
  final Map<String, dynamic> edu;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: jsonListEdu.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
              'Institution: ${edu["institution"]}'),
          subtitle: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text('Degree: ${edu["degree"]}'),
              Row(
                children: [
                  Text(
                      'Start Date: ${edu["startDate"]} - '),
                  Text(
                      'End Date: ${edu["endDate"]}'),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
