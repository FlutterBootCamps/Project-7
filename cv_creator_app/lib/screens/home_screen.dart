import 'package:cv_creator_app/constrans/color.dart';
import 'package:cv_creator_app/helper/screen_helper.dart';
import 'package:cv_creator_app/layers/data_layer.dart';
import 'package:cv_creator_app/screens/registration/bloc/registration_bloc.dart';
import 'package:cv_creator_app/widgets/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(top: 70.0, left: 24, right: 24),
            child: Column(
              children: [
                Text(
                  "Build your perfect CV",
                  style: GoogleFonts.actor(
                      textStyle: const TextStyle(
                          color: darkGreen,
                          fontSize: 30,
                          fontWeight: FontWeight.w800)),
                ),
                Image.asset(
                  "assets/images/home_img.png",
                  height: context.getHeight() * 0.6,
                ),
                Text(
                  "Get professional CV template & expert tips to guide you through every step of the process ",
                  maxLines: 5,
                  style: GoogleFonts.actor(
                      textStyle: const TextStyle(
                          color: brown,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                ),
              ],
            ),
          )),
        );
      }),
    );
  }
}
