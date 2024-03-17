import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project7/core/utils/const_style.dart';
import 'package:project7/model/cv_model.dart';
import 'package:project7/views/Edit-Screen/edit_screen.dart';
import 'package:project7/views/Log-In/log_in.dart';
import 'package:project7/views/view-cv/bloc/view_cv_bloc.dart';

class UserCv extends StatelessWidget {
  const UserCv({
    super.key,
    required this.user_cv,
  });
  final CV user_cv;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white54),
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width * 1,
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    BlocProvider.of<ViewCvBloc>(context).add(LogOutCvEvent(
                    ));
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LogInScreen()));
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.lightBlue,
                  )),
              IconButton(
                  onPressed: () {
                    BlocProvider.of<ViewCvBloc>(context).add(DeleteCvEvent(

                    ));
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
               
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>EditCvScreen()),(route) => false,);
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.lightBlue,
                  )),
                  

              
            ],
          ),
          const Row(children: [Text("  name", style: viewUserStyle)]),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.black26),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(user_cv.name),
            ),
          ),
          const Row(children: [Text("  summary", style: viewUserStyle)]),
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.black26),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(user_cv.summary),
            ),
          ),
          const Row(children: [Text("  Education", style: viewUserStyle)]),
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.black26),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(user_cv.education),
            ),
          ),
          const Row(children: [Text("  Experience", style: viewUserStyle)]),
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.black26),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(user_cv.experience),
            ),
          ),
          const Row(children: [Text("  Skills", style: viewUserStyle)]),
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.black26),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(user_cv.skills),
            ),
          ),
          const Row(children: [Text("  Languages", style: viewUserStyle)]),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.black26),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(user_cv.languages),
            ),
          ),
        ],
      ),
    );
  }
}
