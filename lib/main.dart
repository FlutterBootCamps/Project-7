import 'package:cv_app/pages/cv/bloc/cv_bloc.dart';
import 'package:cv_app/pages/nav_bar/bloc/nav_bloc.dart';
import 'package:cv_app/pages/nav_bar/bottom_navigation_br.dart';
import 'package:cv_app/pages/previus_cv/bloc/previus_cv_bloc.dart';
import 'package:cv_app/pages/sign_up_page.dart';
import 'package:cv_app/services/data_service.dart';
import 'package:cv_app/services/setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env["url"]!,
    anonKey: dotenv.env["anonKey"]!,
  );
  await DataInjection().setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    DataBase().getToken();
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => NavBloc(),
          ),
          BlocProvider(
            create: (context) => CvBloc(),
          ),
          BlocProvider(
            create: (context) => PreviusCvBloc(),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: DataBase().token.isNotEmpty
                ? const BottomNavBar()
                : SignUpPage()));
  }
}
