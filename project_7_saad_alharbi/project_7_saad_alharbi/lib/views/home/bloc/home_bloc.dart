import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_7_saad_alharbi/model/resume_model.dart';
import 'package:project_7_saad_alharbi/service/supabase_services.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<HomeLoadDataEvent>(methodLoadData);
  }

  FutureOr<void> methodLoadData(
      HomeLoadDataEvent event, Emitter<HomeState> emit) async {
        emit(HomeLoadingState());
    try {
      var resumesList = await DBService().getAllResume();
      var resume = await DBService().getResume();
      if (resume == null) {
        print("null");
      }
        emit(HomeLoadState(resumesList: resumesList, resume: resume));
      
    } catch (e) {
      emit(HomeErrorState());
    }
  }
}
