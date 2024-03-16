import 'package:cv_maker_app/bloc/auth_bloc.dart';
import 'package:cv_maker_app/bloc/cv_bloc.dart';
import 'package:cv_maker_app/data_layer/home_data_layer.dart';
import 'package:cv_maker_app/pages/login_page.dart';
import 'package:cv_maker_app/pages/navigation_page.dart';
import 'package:cv_maker_app/utils/setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupDatabase();
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
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => CvBloc(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: (locator.token.isNotEmpty)
              ? const NavigationPage()
              : LoginPage()),
    );
  }
}
