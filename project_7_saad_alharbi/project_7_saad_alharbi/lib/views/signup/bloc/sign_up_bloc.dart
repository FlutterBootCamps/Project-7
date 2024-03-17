import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_7_saad_alharbi/service/supabase_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) {});
    on<SignUpNewUserEvent>(methodSignUpUser);
  }

  FutureOr<void> methodSignUpUser(
      SignUpNewUserEvent event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading());
    if (event.email.trim().isNotEmpty &&
        event.password.trim().isNotEmpty &&
        event.name.trim().isNotEmpty) {
      try {
        await DBService().signUp(email: event.email, password: event.password);
        await DBService().createUser(
            name: event.name, email: event.email);
        emit(SignUpSuccessState(msg: "Sign up Successfully."));
      } on AuthException catch (e) {
        emit(
            SignUpErrorState(msg: "incorrect email/password: ${e.statusCode}"));
      } on Exception catch (e) {
        emit(SignUpErrorState(msg: "incorrect email/password."));
      }
    } else {
      emit(SignUpErrorState(msg: "Fill the require felid"));
    }
  }
}
