import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cv_maker_app/data_layer/home_data_layer.dart';
import 'package:cv_maker_app/models/user_info_model.dart';
import 'package:cv_maker_app/services/db_service.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final locator = GetIt.I.get<HomeData>();
  AuthBloc() : super(AuthInitial()) {
    on<SignupEvent>(signup);
    on<SigninEvent>(signin);
    on<SignoutEvent>(signout);
    on<ViewUserInfoEvent>(viewUserInfo);
  }

  FutureOr<void> signup(SignupEvent event, Emitter<AuthState> emit) async{
    emit(LoadingState());

    if(event.email.trim().isNotEmpty && event.password.trim().isNotEmpty && event.jobField.trim().isNotEmpty && event.name.trim().isNotEmpty){
      try {
        await DBService().signup(email: event.email, password: event.password);
        await DBService().insertUser(name: event.name, jobField: event.jobField, email: event.email, password: event.password);
        emit(SignedUpState(msg: "Welcome ${event.name}, your account has been created!"));
      } on AuthException catch (e) {
        print(e);
        emit(ErrorState(msg: "Email/Password is incorrect, please try again."));
      } on Exception catch (e) {
        print(e);
        emit(ErrorState(msg: "There's an issue with our servers, please try again later..."));
      }
    }else {
      emit(ErrorState(msg: "Please fill all fields."));
    }
  }

  FutureOr<void> signin(SigninEvent event, Emitter<AuthState> emit) async{
    emit(LoadingState());

    if(event.email.isNotEmpty && event.password.isNotEmpty){
      try {
        AuthResponse res = await DBService().signin(email: event.email, password: event.password);
        locator.token = res.session!.accessToken;
        locator.currentUserId = res.user!.id;
        locator.addToken();
        emit(SignedInState(msg: "Successfuly logged in"));
      } on AuthException catch (e) {
        print(e);
        emit(ErrorState(msg: "Email/Password is incorrect, please try again."));
      } on Exception catch (e) {
        print(e);
        emit(ErrorState(msg: "There's an issue with our servers, please try again later..."));
      }
    }else {
      emit(ErrorState(msg: "Please fill all fields."));
    }
  }

  FutureOr<void> signout(SignoutEvent event, Emitter<AuthState> emit) async{
    try {
      await DBService().signout();
      locator.currentUserId = "";
      locator.removeToken();
      emit(SignedOutState(msg: "Sucessfuly logged out, see you soon!"));
    } catch (e) {
      emit(ErrorState(msg: "There's an issue with our servers, please try again later..."));
    }
  }

  FutureOr<void> viewUserInfo(ViewUserInfoEvent event, Emitter<AuthState> emit) async{
    emit(LoadingState());

    try {
      final UserInfo userInfo = await DBService().getCurrentUserInfo();
      emit(ShowUserInfoState(userinfo: userInfo));
    } catch (e) {
      print(e);
      emit(ErrorState(msg: "Error getting user info."));
    }
  }
}
