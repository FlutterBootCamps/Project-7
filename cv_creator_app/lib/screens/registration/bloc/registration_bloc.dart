import 'dart:async';
import 'dart:js';

import 'package:bloc/bloc.dart';
import 'package:cv_creator_app/layers/data_layer.dart';
import 'package:cv_creator_app/services/database_service.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final locator = GetIt.I.get<DataService>();

  bool isHidden = true;

  RegistrationBloc() : super(RegistrationInitial()) {
    // on<RegistrationEvent>((event, emit) {
    //   // TODO: implement event handler
    // });

    on<ShowHidePasswordEvent>(ShowHidePasswordMethod);
    on<SignInEvent>(SignInMethod);
    on<SignUpEvent>(SignUpMethod);
    on<SignOutEvent>(SignOutMethod);
    on<GetUserNameEvent>(getUserNameMethod);
  }

  FutureOr<void> ShowHidePasswordMethod(
      ShowHidePasswordEvent event, Emitter<RegistrationState> emit) {
    isHidden = !isHidden;
    emit(ShowHidePasswordState(isHidden: isHidden));
  }

  FutureOr<void> SignInMethod(
      SignInEvent event, Emitter<RegistrationState> emit) async {
    try {
    emit(LoadingState());
      await DBService().signIn(email: event.email, password: event.password);
      emit(SignInState());
    } on AuthException catch (e) {
      emit(ErrorState(message: e.message));
      print("Email/Password not correct $e ");
    } on Exception catch (e) {
      emit(ErrorState(message: e.toString()));
      print("Something  went wrong");
    }
  }

  FutureOr<void> SignUpMethod(
      SignUpEvent event, Emitter<RegistrationState> emit) async {
    try {
    emit(LoadingState());
      await DBService().signUP(email: event.email, password: event.password);
      await DBService().insertUser(
          name: event.name, email: event.email, password: event.password);

      emit(SignUpState());
    } on AuthException catch (e) {
      print("Email/Password not correct $e ");
      emit(ErrorState(message: e.message));
    } on Exception catch (e) {
      print("Something  went wrong");
      emit(ErrorState(message: e.toString()));
    }
  }



  FutureOr<void> SignOutMethod(SignOutEvent event, Emitter<RegistrationState> emit) async{
    await DBService().singOut();
  }

  FutureOr<void> getUserNameMethod(event, Emitter<RegistrationState> emit) async {
    emit(LoadingState());
    await DBService().getUser();
    emit(SuccessState());
  }
}
