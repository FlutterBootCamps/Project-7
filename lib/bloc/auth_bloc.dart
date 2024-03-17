import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project7/service/db.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignupEvent>((event, emit) async{
      try{
      await DBService().signUp(email: event.email, password: event.password);
      emit (SuccessState());
      }catch(m){
        emit (ErrorState());
      }
      
    });
  }
}
