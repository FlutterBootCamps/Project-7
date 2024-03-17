import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:project_7_saad_alharbi/data_layer/home_data_layer.dart';
import 'package:project_7_saad_alharbi/utils/setup.dart';
import 'package:project_7_saad_alharbi/views/bottom_nav/bottom_nav.dart';
import 'package:project_7_saad_alharbi/views/home/bloc/home_bloc.dart';
import 'package:project_7_saad_alharbi/views/login/login_page.dart';
import 'package:project_7_saad_alharbi/views/profile/bloc/profile_bloc.dart';
import 'package:project_7_saad_alharbi/views/resume/bloc/resume_bloc.dart';
import 'package:project_7_saad_alharbi/views/resume_template/bloc/resume_template_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await databaseConfig();
  await setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final locator = GetIt.I.get<HomeData>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ResumeBloc(),
        ),
        BlocProvider(
          create: (context) => HomeBloc()..add(HomeLoadDataEvent()),
        ),
        BlocProvider(
          create: (context) => ProfileBloc()..add(ProfileLoadEvent()),
        ),
        BlocProvider(
          create: (context) => ResumeTemplateBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: locator.token.isNotEmpty ? BottomNav() : LoginPage(),
      ),
    );
  }
}
