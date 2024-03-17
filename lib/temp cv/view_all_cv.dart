import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:try_auth_suba/api/serves.dart';
import 'package:try_auth_suba/bloc/member_bloc.dart';
import '../page/create_cv/certification/view.dart';
import '../page/create_cv/edu/view.dart';
import '../page/create_cv/experience/view.dart';
import '../page/create_cv/project/view.dart';
import '../page/create_cv/reference/view.dart';

class AllCv extends StatelessWidget {
  const AllCv({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Text("${snapshot.data!.email}");
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("waiting");
            }
            return const Text("no data");
          },
          future: Serves().getUserNameByToken(),
        ),
      ),
      body: BlocBuilder<MemberBloc, MemberState>(
        builder: (context, state) {
          if (state is MemberShow) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
              child: ListView.builder(
                itemCount: state.listMember.length,
                itemBuilder: (context, index) {
                  var userData = state.listMember[index];
                  List<dynamic> jsonListEdu = jsonDecode(userData["education"]);
                  Map<String, dynamic> edu = {};
                  jsonListEdu.forEach((item) {
                    edu.addAll(item);
                  });
                  List<dynamic> jsonListRef =
                      jsonDecode(userData["references_person"]);
                  Map<String, dynamic> ref = {};
                  jsonListRef.forEach((item) {
                    ref.addAll(item);
                  });
                  List<dynamic> jsonListCer =
                      jsonDecode(userData["certification"]);
                  Map<String, dynamic> cer = {};
                  jsonListCer.forEach((item) {
                    cer.addAll(item);
                  });

                  List<dynamic> jsonListPro = jsonDecode(userData["project"]);
                  Map<String, dynamic> pro = {};
                  jsonListPro.forEach((item) {
                    pro.addAll(item);
                  });

                  List<dynamic> jsonListExp =
                      jsonDecode(userData["experience"]);
                  Map<String, dynamic> exp = {};

                  jsonListExp.forEach((item) {
                    exp.addAll(item);
                  });
                  List<dynamic> jsonListLang =
                      jsonDecode(userData["languages"]);
                  List<dynamic> jsonListSkills = jsonDecode(userData["skills"]);
                  return Card(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                              index % 2 == 0
                                  ? "image/duck-2-svgrepo-com.svg"
                                  : "image/duck-3-svgrepo-com.svg",
                              color: Colors.black,
                              height: 20,
                              width: 20),
                          SingleChildScrollView(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Name: ${userData["name"]}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text('Address: ${userData["address"]} | '),
                                    Text('Phone: ${userData["phone"]} | '),
                                  ],
                                ),
                                Text('Email: ${userData["email"]} | '),
                                Row(
                                  children: [
                                    Text(
                                        'GitHub: ${userData["githubLink"]} | '),
                                    Text('LinkedIn: ${userData["phone"]}'),
                                  ],
                                ),
                                const Divider(),
                                const SizedBox(height: 16),
                                Text(
                                  'Summary: ${userData["summary"]}',
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const Divider(),
                                const SizedBox(height: 8),
                                const Text(
                                  'Education:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.8,
                                  child: EduWidget(jsonListEdu: jsonListEdu, edu: edu),
                                ),
                                const Divider(),
                                const SizedBox(height: 16),
                                const Text(
                                  'Experience:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.8,
                                  child: expWidget(jsonListExp: jsonListExp, exp: exp),
                                ),
                                const Divider(),
                                const Text(
                                  'Project :',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.8,
                                  child: projectWidget(jsonListPro: jsonListPro, pro: pro),
                                ),
                                const Divider(),
                                const Text(
                                  'Reference :',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.8,
                                  child: refWidget(jsonListRef: jsonListRef, ref: ref),
                                ),
                                const Divider(),
                                const Text(
                                  'certification :',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.8,
                                  child: cerWidget(jsonListCer: jsonListCer, cer: cer),
                                ),
                                const Divider(),
                                const SizedBox(height: 16),
                                const Text(
                                  'Languages:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Wrap(
                                  spacing: 8,
                                  children: [
                                    for (var lang in jsonListLang)
                                      Chip(label: Text(lang)),
                                  ],
                                ),
                                const Text(
                                  'Skills:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Wrap(
                                  spacing: 8,
                                  children: [
                                    for (var skill in jsonListSkills)
                                      Chip(label: Text(skill)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ]),
                  );
                },
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
