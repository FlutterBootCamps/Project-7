import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project7/services/database.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInEvent>((event, emit) {});
    on<SignInEventEvent>((event, emit) async {
      if (event.email.trim().isNotEmpty && event.password.trim().isNotEmpty) {
        try {
          await DBService()
              .signUp(email: event.email, password: event.password);
              emit(SuccessSignInState(massage: "Sign-In Successfully"));
        }on AuthException catch (e) {
         emit(ErrorSignInState(massage: "incorrect email or password ${e.statusCode}"));
        }
      }else{
        emit(ErrorSignInState(massage: "incorrect email or password"));
      }
    });
  }
}
