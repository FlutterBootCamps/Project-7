import 'package:cv_creator_app/bloc/cv_bloc.dart';
import 'package:cv_creator_app/layers/data_layer.dart';
import 'package:cv_creator_app/screens/home_screen.dart';
import 'package:cv_creator_app/screens/registration/bloc/registration_bloc.dart';
import 'package:cv_creator_app/screens/registration/signin.dart';
import 'package:cv_creator_app/setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env['supabaseUrl']!,
    anonKey: dotenv.env['anon_Key']!,
  );
  await setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final locator = GetIt.I.get<DataService>();
    locator.getToken();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CvBloc()..add(FetchCVsEvent()),
        ),
        BlocProvider(
          create: (context) => RegistrationBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: locator.token.isEmpty ? SignInScreen() : const HomeScreen(),
      ),
    );
  }
}
