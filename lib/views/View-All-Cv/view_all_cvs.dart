import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project7/model/cv_model.dart';
import 'package:project7/views/View-All-Cv/bloc/all_cvs_bloc.dart';
import 'package:project7/views/view-cv/widgets/user_cv.dart';

class ViewAllCvs extends StatelessWidget {
  ViewAllCvs({super.key});
  CV? cv;
  @override
  Widget build(BuildContext context) {
    context.read<AllCvsBloc>().add(ViewAllCvsEvent());

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/void.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocBuilder<AllCvsBloc, AllCvsState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is seccessState) {
              return ListView.builder(
                itemCount: state.cv.length,
                itemBuilder: (BuildContext context, int index) {
                  if (state.cv.isNotEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        height: 200,
                        width: 300,
                        child: UserCv(
                          user_cv: state.cv[index],
                        ),
                      ),
                    );
                  } else {
                    return const Text("Error");
                  }
                },
              );
            } else {
              return const Text("Error");
            }
          },
        ),
      ),
    );
  }
}
