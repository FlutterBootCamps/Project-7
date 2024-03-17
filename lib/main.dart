import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_auth_suba/api/serves.dart';
import 'package:try_auth_suba/bloc/member_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:try_auth_suba/page/log.dart';
import 'package:try_auth_suba/page/user_cv.dart';
import 'package:try_auth_suba/setup/git_it.dart';
import 'package:try_auth_suba/temp%20cv/view_all_cv.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  gitIt().init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MemberBloc()..add(gitDataEvent()),
      child: MaterialApp(
        home:
         gitIt().locator.get<Serves>().token == ""
            ? const LoginPage()
            : const UserCv(),
      ),
    );
  }
}
