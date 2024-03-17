import 'package:bloc/bloc.dart';
import 'package:cv_app/models/cv_model.dart';
import 'package:cv_app/services/data_service.dart';
import 'package:cv_app/services/setup.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'cv_event.dart';
part 'cv_state.dart';

class CvBloc extends Bloc<CvEvent, CvState> {
  CvBloc() : super(CvInitial()) {
    final servicelocater = DataInjection().locater.get<DataBase>();

    on<FetchInformationEvent>((event, emit) async {
      print("object");
      emit(LoadingState());
      List<CvModel> cvlist = await servicelocater.fetchListResumes();
      emit(SuccessState(cvlist));
    });
  }
}
