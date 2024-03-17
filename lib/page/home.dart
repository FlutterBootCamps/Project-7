import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:try_auth_suba/api/serves.dart';
import 'package:try_auth_suba/bloc/member_bloc.dart';

class HomePage1 extends StatelessWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController noteController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: FutureBuilder(
          future: Serves().getUserNameByToken(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Text("${snapshot.data!.email}");
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Waiting");
            }
            return const Text("No data");
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 200,
                color: Colors.blueGrey.shade300,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Enter the note",
                          ),
                          controller: noteController,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            String noteText = noteController.text.trim();
                            if (noteText.isNotEmpty) {
                              // Handle adding note here
                              noteController.clear();
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text('Please enter a note'),
                                ),
                              );
                            }
                          },
                          child: const Text('Add'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: BlocBuilder<MemberBloc, MemberState>(
        builder: (context, state) {
          if (state is MemberShow) {
            return FutureBuilder(
              future: Serves().getCVOfUser(),
              builder: (context, snapshot) {
                print(snapshot.data!.length);
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Failed to load user data'));
                } else if (snapshot.hasData) {
                  final userData = snapshot.data ;
                  return FlutterResumeTemplate(
                    data: TemplateData(
                      fullName: "$userData",
                      currentPosition: 'Flutter Developer',
                      // Add other necessary fields here
                    ),
                    templateTheme: TemplateTheme.business,
                    mode: TemplateMode.onlyEditableMode,
                    showButtons: false,
                    imageBoxFit: BoxFit.cover,
                    height: 2500,
                  );
                } else {
                  return const Center(child: Text('No data available'));
                }
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
