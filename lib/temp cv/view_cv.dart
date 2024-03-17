import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:try_auth_suba/api/serves.dart';
import 'package:try_auth_suba/bloc/member_bloc.dart';
import 'package:try_auth_suba/model/cv_model.dart';
import 'package:try_auth_suba/setup/git_it.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController note = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        actions: [
          Text("id : ${gitIt().locator.get<Serves>().user_id}            ")
        ],
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
      floatingActionButton: IconButton(
          color: Colors.indigo,
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 200,
                  color: Colors.blueGrey.shade300,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextField(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "the note"),
                              controller: note),
                          ElevatedButton(
                            child: const Text('add'),
                            onPressed: () {
                              if (note.text.isNotEmpty) {
                                // BlocProvider.of<MemberBloc>(context)
                                //     .add(addMember());

                                final snackBar = SnackBar(
                                  elevation: 0,
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  content: AwesomeSnackbarContent(
                                    title: 'success',
                                    message: 'success add new data to database',
                                    contentType: ContentType.success,
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentMaterialBanner()
                                  ..showSnackBar(snackBar);
                                note.clear();
                                Navigator.pop(context);
                              } else {
                                final snackBar = SnackBar(
                                  elevation: 0,
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  content: AwesomeSnackbarContent(
                                    title: 'failure',
                                    message:
                                        'failure to add new data to database',
                                    contentType: ContentType.success,
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentMaterialBanner()
                                  ..showSnackBar(snackBar);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          )),
      body: BlocBuilder<MemberBloc, MemberState>(
        builder: (context, state) {
          if (state is MemberShow) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
              child: ListView.builder(
                itemCount: state.listMember.length,
                itemBuilder: (context, index) {
                  var userData= state.listMember[index];
                  print(userData);
                  print(userData["experience"]);
                  print(userData["education"]);
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
                         FlutterResumeTemplate(
                    data: TemplateData(
                      fullName: userData["name"],
                      address: userData["address"],
                      email: userData["email"],
                      phoneNumber: userData["phone"],
                      bio: userData["summary"],
                      experience: userData["experience"][0].map((exp) {
                        return ExperienceData(
                          experienceTitle: exp["position"],
                          experienceLocation: exp["company"],
                          experiencePeriod: '${exp["startDate"]} - ${exp["endDate"]}',
                          experiencePlace: "",
                          experienceDescription: exp["description"],
                        );
                      }).toList(),
                      educationDetails: userData["education"].map((edu) {
                        return Education(edu.degree, edu.institution);
                      }).toList(),
                      languages: userData["name"].map((lang) {
                        return Language(lang, 5); // You can adjust the language proficiency as needed
                      }).toList(),
                    ),
                    templateTheme: TemplateTheme.business,
                    mode: TemplateMode.onlyEditableMode,
                    showButtons: false,
                    imageBoxFit: BoxFit.cover,
                    height: 2500,
                  ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    BlocProvider.of<MemberBloc>(context).add(
                                        deleteMember(
                                            state.listMember[index]["id"]));
                                    final snackBar = SnackBar(
                                      elevation: 0,
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.transparent,
                                      content: AwesomeSnackbarContent(
                                        title: 'success',
                                        message:
                                            'success delete data from database',
                                        contentType: ContentType.success,
                                      ),
                                    );
                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentMaterialBanner()
                                      ..showSnackBar(snackBar);
                                  },
                                  icon: const Icon(Icons.delete)),
                              IconButton(
                                  onPressed: () {
                                    showModalBottomSheet<void>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: 200,
                                          color: Colors.blueGrey.shade300,
                                          child: Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16.0,
                                                      vertical: 8),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  TextField(
                                                      decoration: const InputDecoration(
                                                          border: OutlineInputBorder(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          20))),
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          hintText: "new name"),
                                                      controller: note),
                                                  ElevatedButton(
                                                    child: const Text('edit'),
                                                    onPressed: () {
                                                      if (note
                                                          .text.isNotEmpty) {
                                                        {
                                                          BlocProvider.of<
                                                                      MemberBloc>(
                                                                  context)
                                                              .add(updateMember(
                                                                  state.listMember[
                                                                          index]
                                                                      ["id"],
                                                                  note.text));
                                                          final snackBar =
                                                              SnackBar(
                                                            elevation: 0,
                                                            behavior:
                                                                SnackBarBehavior
                                                                    .floating,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            content:
                                                                AwesomeSnackbarContent(
                                                              title: 'success',
                                                              message:
                                                                  'success edit data from database',
                                                              contentType:
                                                                  ContentType
                                                                      .success,
                                                            ),
                                                          );
                                                          ScaffoldMessenger.of(
                                                              context)
                                                            ..hideCurrentMaterialBanner()
                                                            ..showSnackBar(
                                                                snackBar);
                                                          note.clear();
                                                          Navigator.pop(
                                                              context);
                                                        }
                                                      } else {
                                                        final snackBar =
                                                            SnackBar(
                                                          elevation: 0,
                                                          behavior:
                                                              SnackBarBehavior
                                                                  .floating,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          content:
                                                              AwesomeSnackbarContent(
                                                            title: 'failure',
                                                            message:
                                                                'failure to edit data from database',
                                                            contentType:
                                                                ContentType
                                                                    .failure,
                                                          ),
                                                        );
                                                        ScaffoldMessenger.of(
                                                            context)
                                                          ..hideCurrentMaterialBanner()
                                                          ..showSnackBar(
                                                              snackBar);
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  icon: const Icon(Icons.edit))
                            ],
                          )
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
