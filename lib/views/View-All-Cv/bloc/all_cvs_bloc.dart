import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project7/model/cv_model.dart';
import 'package:project7/services/database.dart';

part 'all_cvs_event.dart';
part 'all_cvs_state.dart';

class AllCvsBloc extends Bloc<AllCvsEvent, AllCvsState> {
  AllCvsBloc() : super(AllCvsInitial()) {
    on<AllCvsEvent>(getallcvs);
  }

  FutureOr<void> getallcvs(AllCvsEvent event, Emitter<AllCvsState> emit)async{
    try {
      emit(seccessState(await DBService().fetchAllCvs()));
    } catch (e) {
      print(e);
    }
  }
}
