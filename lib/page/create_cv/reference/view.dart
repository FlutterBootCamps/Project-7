import 'package:flutter/material.dart';

class refWidget extends StatelessWidget {
  const refWidget({
    super.key,
    required this.jsonListRef,
    required this.ref,
  });

  final List jsonListRef;
  final Map<String, dynamic> ref;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: jsonListRef.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('name: ${ref["name"]}'),
          subtitle: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                  'position: ${ref["position"]}'),
              Text('company: ${ref["company"]}'),
              Text('email : ${ref["email"]}'),
              Text('phone : ${ref["phone"]}'),
            ],
          ),
        );
      },
    );
  }
}
