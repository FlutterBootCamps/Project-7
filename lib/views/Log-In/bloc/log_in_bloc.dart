import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:project7/data_layer/data.dart';
import 'package:project7/services/database.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'log_in_event.dart';
part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInBloc() : super(LogInInitial()) {
    on<LogInEvent>((event, emit) {});
    on<LogInEventEvent>((event, emit) async {
      final locator = GetIt.I.get<HomeData>();
      if (event.email.trim().isNotEmpty && event.password.trim().isNotEmpty) {
        try {
           final userId = await DBService().logInAccount(email: event.email, password: event.password);
           locator.token = DBService().supabase.auth.currentSession!.accessToken;
           locator.addToken();
           locator.id =userId;
          emit(SuccessState(massage: "LogIn Successfully"));
        } on AuthException catch (e) {
          emit(ErrorState(massage: "incorrect email or password  #${e.statusCode}"));
        }
      } else {
        emit(ErrorState(massage: "incorrect email or password"));
      }
    });
  }
}
