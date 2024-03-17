import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:project7/data_layer/data.dart';
import 'package:project7/services/get_it.dart';
import 'package:project7/views/Edit-Screen/bloc/edit_bloc.dart';
import 'package:project7/views/Log-In/bloc/log_in_bloc.dart';
import 'package:project7/views/Log-In/log_in.dart';
import 'package:project7/views/Sign-In/bloc/sign_in_bloc.dart';
import 'package:project7/views/View-All-Cv/bloc/all_cvs_bloc.dart';
import 'package:project7/views/home-screen/bloc/home_bloc.dart';
import 'package:project7/views/view-cv/bloc/view_cv_bloc.dart';
import 'package:project7/views/widgets/nav_bottom.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await databaseConfig();
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
      final locator = GetIt.I.get<HomeData>();
      locator.getToken();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LogInBloc(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => EditBloc(),
        ),
        BlocProvider(
          create: (context) => ViewCvBloc()..add(FachDataEvent()),
        ),
        BlocProvider(
          create: (context) => AllCvsBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: locator.token.isNotEmpty ? NavBottomBar() : LogInScreen()
      ),
    );
  }
}
