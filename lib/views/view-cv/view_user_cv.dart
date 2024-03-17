import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project7/views/view-cv/bloc/view_cv_bloc.dart';
import 'package:project7/views/view-cv/widgets/user_cv.dart';

class ViewUserCv extends StatelessWidget {
  const ViewUserCv({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    context.read<ViewCvBloc>().add(FachDataEvent());
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/blue.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<ViewCvBloc, ViewCvState>(
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is DisplayInfoState) {
                      return ListView.builder(
                        itemCount:
                            state.classCv.isEmpty ? 1 : state.classCv.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          if (state.classCv.isEmpty) {
                            return Center(child: Text('Error: You Don\'t Have Cv'));
                          } else {
                            return UserCv(user_cv: state.classCv[index]);
                          }
                        },
                      );
                    } else {
                      return (Text("Error"));
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }
}
