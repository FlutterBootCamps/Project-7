import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:project7/data/data_layer.dart';

import '../../service/db.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final locator = GetIt.I.get<HomeData>();

  SigninBloc() : super(SigninInitial()) {

 

     on<SigninnEvent>((event, emit) async{
      try{
        final id =
      await DBService().signIn(email: event.email, password: event.password);
      locator.token=DBService().supabase.auth.currentSession!.accessToken;
      locator.addToken();
      locator.id =id;
      emit (SignInSuccessState());
      }catch(m){
      
      emit( ErrorState(wrongSignIn: 'Your Email or Password  not Correct Try Again'));
      }
      
    });
    //    on<SignOutEvent>((event, emit) async{
    //   try{
    //     await DBService().signOut();
    //   locator.removeToken();
    //   emit(SignOutSuccessState());
    //   }catch(e){
    //     emit(ErrorState(wrongSignIn: "wrong SignOut"));
    //   }
      
    
      
    
    // });
    
  }
}
