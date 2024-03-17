
import 'package:flutter/material.dart';
import 'package:try_auth_suba/model/certification.dart';

class CertificationWidget extends StatelessWidget {
  const CertificationWidget({
    super.key,
    required this.data,
    required this.descriprion,
    required this.organization,
    required this.title,
    required this.certificationList,
  });

  final TextEditingController data;
  final TextEditingController descriprion;
  final TextEditingController organization;
  final TextEditingController title;
  final List<Certification> certificationList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "date"),
                  controller: data),
              TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "descriprion"),
                  controller: descriprion),
              TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "organization"),
                  controller: organization),
              TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "title"),
                  controller: title),
              ElevatedButton(
                child: const Text('add'),
                onPressed: () {
                  if (title.text.isNotEmpty) {
                    certificationList.add(Certification(
                        date: data.text,
                        description: descriprion.text,
                        organization: organization.text,
                        title: title.text));
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

