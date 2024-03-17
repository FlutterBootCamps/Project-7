
import 'package:flutter/material.dart';

class cerWidget extends StatelessWidget {
  const cerWidget({
    super.key,
    required this.jsonListCer,
    required this.cer,
  });

  final List jsonListCer;
  final Map<String, dynamic> cer;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: jsonListCer.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('title: ${cer["title"]}'),
          subtitle: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                  'organization: ${cer["organization"]}'),
              Text('date: ${cer["date"]}'),
              Text(
                  'description : ${cer["description"]}'),
            ],
          ),
        );
      },
    );
  }
}
