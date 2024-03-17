import 'package:cv_creator_app/bloc/cv_bloc.dart';
import 'package:cv_creator_app/constrans/color.dart';
import 'package:cv_creator_app/layers/data_layer.dart';
import 'package:cv_creator_app/screens/registration/bloc/registration_bloc.dart';
import 'package:cv_creator_app/widgets/cv_widget.dart';
import 'package:cv_creator_app/widgets/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class AllUserCVsScreen extends StatelessWidget {
  const AllUserCVsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locator = GetIt.I.get<DataService>();

    return BlocProvider(
        create: (context) => RegistrationBloc(),
        child: Builder(builder: (context) {
          context.read<RegistrationBloc>().add(GetUserNameEvent());

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
                      style: GoogleFonts.acme(
                          textStyle: const TextStyle(color: white)),
                    );
                  }
                  return const Text("Hi");
                },
              ),
              iconTheme: const IconThemeData(color: white, size: 25),
            ),
            body: Center(
                child: ListView(
              shrinkWrap: true,
              children: [
                BlocBuilder<CvBloc, CvState>(
                  builder: (context, state) {
                    if (state is LoadingCVState) {
                      return const Center(
                        child: CircularProgressIndicator(color: darkGreen),
                      );
                    }
                    if (state is DisplayCVState) {
                      if (state.cvs.isNotEmpty) {
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: state.cvs.length,
                            itemBuilder: (context, index) {
                              return CVWidget(cv: state.cvs[index]);
                            });
                      } else {
                        return Image.asset("assets/images/no_data.png");
                      }
                    }
                    return const Text("error");
                  },
                ),
              ],
            )),
          );
        }));
  }
}
