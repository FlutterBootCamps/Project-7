
import 'package:flutter/material.dart';

class expWidget extends StatelessWidget {
  const expWidget({
    super.key,
    required this.jsonListExp,
    required this.exp,
  });

  final List jsonListExp;
  final Map<String, dynamic> exp;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: jsonListExp.length,
      itemBuilder: (context, index) {
        return ListTile(
          title:
              Text('Company: ${exp["company"]}'),
          subtitle: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                  'Position: ${exp["position"]}'),
              Text(
                  'Start Date: ${exp["startDate"]}'),
              Text('End Date: ${exp["endDate"]}'),
              Text(
                  'Description: ${exp["description"]}'),
            ],
          ),
        );
      },
    );
  }
}
