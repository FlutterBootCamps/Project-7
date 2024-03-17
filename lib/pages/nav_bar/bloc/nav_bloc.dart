import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'nav_event.dart';
part 'nav_state.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  NavBloc() : super(SuccessState(0)) {
    on<NavEvent>((event, emit) {
      int currentIndex = 0;
      emit(SuccessState(currentIndex));
    });

    on<ChangeThePageEvent>(ChangePageMethod);
  }

  //change the Navigator index when there are event on tabs
  FutureOr<void> ChangePageMethod(
      ChangeThePageEvent event, Emitter<NavState> emit) {
    emit(SuccessState(event.currentIndex));
  }
}
