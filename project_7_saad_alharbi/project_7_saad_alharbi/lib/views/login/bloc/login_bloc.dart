import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:project_7_saad_alharbi/data_layer/home_data_layer.dart';
import 'package:project_7_saad_alharbi/service/supabase_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});
    on<LoginUserEvent>(methodLoginUser);
  }

  FutureOr<void> methodLoginUser(LoginUserEvent event, Emitter<LoginState> emit)async {
      final locator = GetIt.I.get<HomeData>();

    emit(LoginLoading());
    if (event.email.trim().isNotEmpty && event.password.trim().isNotEmpty) {
      try {
       final String userId = await DBService().login(email: event.email, password: event.password);
        locator.id = userId;
        locator.token = DBService().supabase.auth.currentSession!.accessToken;
        locator.addToken();
        emit(LoginSuccessState(msg: "Login Successfully."));
      } on AuthException catch (e) {
        emit(
            LoginErrorState(msg: "incorrect email/password: ${e.statusCode}"));
      } on Exception catch (e) {
        emit(LoginErrorState(msg: "incorrect email/password."));
        print(e);
      }
    } else {
      emit(LoginErrorState(msg: "Fill the require felid"));
    }
  }
}
