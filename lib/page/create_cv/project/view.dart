import 'package:flutter/material.dart';

class projectWidget extends StatelessWidget {
  const projectWidget({
    super.key,
    required this.jsonListPro,
    required this.pro,
  });

  final List jsonListPro;
  final Map<String, dynamic> pro;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: jsonListPro.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('title: ${pro["title"]}'),
          subtitle: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                  'description: ${pro["description"]}'),
              Text(
                  'start Date: ${pro["startDate"]}'),
              Text('endDate : ${pro["endDate"]}'),
            ],
          ),
        );
      },
    );
  }
}
