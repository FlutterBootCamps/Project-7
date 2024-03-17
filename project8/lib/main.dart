import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:project8/bloc/cv_bloc.dart';
import 'package:project8/data/data_layer.dart';
import 'package:project8/view/home_page.dart';
import 'package:project8/view/login_page.dart';
import 'package:project8/view/personalpage.dart';
import 'package:project8/view/profile_page.dart';
import 'package:project8/view/tamplet_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
      url: dotenv.env["SUPABASE_URL"]!,
      anonKey: dotenv.env["SUPABASE_ANON_KEY"]!);
  DataLayer().setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CvBloc()..add(FetchEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LogInPage(),
      ),
    );
  }
}
