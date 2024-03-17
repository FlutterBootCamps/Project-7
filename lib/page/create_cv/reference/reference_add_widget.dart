
import 'package:flutter/material.dart';
import 'package:try_auth_suba/model/references.dart';

class ReferenceWidget extends StatelessWidget {
  const ReferenceWidget({
    super.key,
    required this.companyRf,
    required this.emailRf,
    required this.nameRf,
    required this.phoneRf,
    required this.positionRf,
    required this.referenceList,
  });

  final TextEditingController companyRf;
  final TextEditingController emailRf;
  final TextEditingController nameRf;
  final TextEditingController phoneRf;
  final TextEditingController positionRf;
  final List<Reference> referenceList;

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
                      hintText: "company"),
                  controller: companyRf),
              TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "email"),
                  controller: emailRf),
              TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "name"),
                  controller: nameRf),
              TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "phone"),
                  controller: phoneRf),
              TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "position"),
                  controller: positionRf),
              ElevatedButton(
                child: const Text('add'),
                onPressed: () {
                  if (companyRf.text.isNotEmpty) {
                    referenceList.add(Reference(
                        company: companyRf.text,
                        email: emailRf.text,
                        name: nameRf.text,
                        phone: phoneRf.text,
                        position: positionRf.text));
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
