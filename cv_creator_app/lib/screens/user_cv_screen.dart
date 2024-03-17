import 'package:cv_creator_app/bloc/cv_bloc.dart';
import 'package:cv_creator_app/constrans/color.dart';
import 'package:cv_creator_app/helper/screen_helper.dart';
import 'package:cv_creator_app/layers/data_layer.dart';
import 'package:cv_creator_app/screens/registration/bloc/registration_bloc.dart';
import 'package:cv_creator_app/screens/update_cv_screen.dart';
import 'package:cv_creator_app/widgets/cv_widget.dart';
import 'package:cv_creator_app/widgets/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class UserCVScreen extends StatelessWidget {
  const UserCVScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final locator = GetIt.I.get<DataService>();


    return BlocProvider(
      create: (context) => CvBloc(),

      child: Builder(
        builder: (context) {
          context.read<RegistrationBloc>().add(GetUserNameEvent());

          context.read<CvBloc>().add(GetUserCVEvent());

          return Scaffold(
             drawer: const Drawer(
              child: DrawerMenu(),
            ),
            appBar: AppBar(
              backgroundColor: darkGreen,
              title: BlocBuilder<RegistrationBloc, RegistrationState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(color: lightWhite),
                    );
                  }
                  if (state is SuccessState) {
                    return Text(
                      " Welcome ${locator.userName}",
                       style: GoogleFonts.acme( textStyle:  const TextStyle(color: white)),
                      // style: const TextStyle(
                      //   color: white,
                      // ),
                    );
                  }
                  return const Text("Hi", style: TextStyle(
                        color: white,
                      ),);
                },
              ),
              iconTheme: const IconThemeData(color: white, size: 25),
            ),
           
            body: Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Center(
                  child: ListView(shrinkWrap: true, children: [
                BlocBuilder<CvBloc, CvState>(
                  builder: (context, state) {
                    if (state is LoadingCVState) {
                      return const Center(
                        child: CircularProgressIndicator(color: darkGreen),
                      );
                    }
                    if (state is DisplayUserCVState) {
                      if(state.userCV.isNotEmpty){
                      
                      return Column(
                        children: [
                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal:  12),
                             child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                      Text("your current CV",  style: GoogleFonts.acme( textStyle:  const TextStyle(color: darkGreen, fontSize: 18)),),
                                  Row(
                                    children: [
                                IconButton(
                                  onPressed: (){
                                    context.pushTo(view: UpdateCVScreen(userCV: locator.userCV,));
                                  },
                                  icon : const Icon(Icons.edit, color: grey,)),
                                IconButton(
                                  onPressed:(){
                                    context.read<CvBloc>().add(DeleteCVEvent());
                                    context.read<CvBloc>().add(GetUserCVEvent());
                                  }, 
                                  icon: const Icon(Icons.delete_rounded, color: grey,)),
                                    ],
                                  ),
                              ],),
                           ),
                          ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: state.userCV.length,
                              itemBuilder: (context, index) {
                                locator.userCV = state.userCV[index];
                                return CVWidget(cv: state.userCV[index]);
                              }),
                        ],
                      );
                      } else{
                        return  Image.asset("assets/images/no_data.png");
                      } 
                    }
                    return const Text("error");
                    // CVWidget();
                  },
                ),
              ])),
            ),
          );
        }
      ),
    );
  }
}
