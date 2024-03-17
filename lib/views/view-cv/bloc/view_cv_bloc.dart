import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project7/model/cv_model.dart';
import 'package:project7/services/database.dart';

part 'view_cv_event.dart';
part 'view_cv_state.dart';

class ViewCvBloc extends Bloc<ViewCvEvent, ViewCvState> {
  ViewCvBloc() : super(ViewCvInitial()) {
    on<ViewCvEvent>((event, emit) {});

    on<FachDataEvent>(getData);
    on<DeleteCvEvent>(deleteUser);
    on<LogOutCvEvent>(logOut);
  }

  FutureOr<void> logOut(LogOutCvEvent event, Emitter<ViewCvState> emit)async {
    await DBService().logOutUser();


  }
}

FutureOr<void> deleteUser(
    DeleteCvEvent event, Emitter<ViewCvState> emit) async {
  await DBService().deleteData();
}

FutureOr<void> getData(event, emit) async {
  emit(LoadingState());
  try {
    emit(DisplayInfoState(classCv: await DBService().fetchCV()));
  } catch (e) {
    print(e);
  }
}
