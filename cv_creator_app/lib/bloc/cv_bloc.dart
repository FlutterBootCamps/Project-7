import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cv_creator_app/layers/data_layer.dart';
import 'package:cv_creator_app/models/cv_model.dart';
import 'package:cv_creator_app/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'cv_event.dart';
part 'cv_state.dart';

class CvBloc extends Bloc<CvEvent, CvState> {
   List<Widget> skills = [];
   List<Widget> eductions = [];
   List<Widget> experiences = [];
   List<Widget> projects = [];
   List<Widget> references = [];

    final locator = GetIt.I.get<DataService>();

  CvBloc() : super(CvInitial()) {


    TextEditingController skillController = TextEditingController();


    // on<CvEvent>((event, emit) {
    //   // TODO: implement event handler
    // });

    on<FetchCVsEvent>(fetchCVMethod);
    on<GetUserCVEvent>(getUserCVMethod);
    on<AddNewCVEvent>(addNewCVMethod);
    on<UpdateCVEvent>(updateCVMethod);
    on<DeleteCVEvent>(deleteCVMethod);
  }

  FutureOr<void> fetchCVMethod(FetchCVsEvent event, Emitter<CvState> emit) async {
    emit(LoadingCVState());
    final usersCV =  await DBService().getAllCV();
    emit(DisplayCVState(cvs: usersCV));
  }

  FutureOr<void> getUserCVMethod(GetUserCVEvent event, Emitter<CvState> emit) async{
    emit(LoadingCVState());
    final usersCV =  await DBService().getUserCV();
    emit(DisplayUserCVState(userCV: usersCV));
    
  }

  FutureOr<void> deleteCVMethod(DeleteCVEvent event, Emitter<CvState> emit) async {
    emit(LoadingCVState());
    await DBService().deleteCv();
    emit(SuccessCVState());
  }

  FutureOr<void> addNewCVMethod(AddNewCVEvent event, Emitter<CvState> emit) async{
    emit(LoadingCVState());
    await DBService().addCV(userCV: event.cv);
    emit(SuccessAddCVState());
  }


  FutureOr<void> updateCVMethod(UpdateCVEvent event, Emitter<CvState> emit) async  {
    emit(LoadingCVState());
    
    await DBService().updateUserCV(updateUserCV: event.cv);
    emit(SuccessUpdateCVState());
    final usersCV =  await DBService().getUserCV();
    emit(DisplayUserCVState(userCV: usersCV ));

  }
}
