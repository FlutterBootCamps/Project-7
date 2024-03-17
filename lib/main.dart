import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:project7/bloc/auth_bloc.dart';
import 'package:project7/bloc/bloc/bloc/creatcv_bloc.dart';
import 'package:project7/bloc/bloc/signin_bloc.dart';
import 'package:project7/data/data_layer.dart';

import 'package:project7/service/data_base.dart';


import 'page/welcome_screen.dart';



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
    locator.getToken();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SigninBloc(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => CreatcvBloc()..add(FetchDataEvent()),
        ),
        
      ],
      child:   const MaterialApp(
          debugShowCheckedModeBanner: false, home: WelcomePage(),
          // locator.token.isNotEmpty? NavBottom() : 
      )
    );
  }
}

