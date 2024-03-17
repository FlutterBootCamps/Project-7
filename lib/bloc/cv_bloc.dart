import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project8/data/data_layer.dart';
import 'package:project8/model/cv_model.dart';
import 'package:project8/service/database.dart';

part 'cv_event.dart';
part 'cv_state.dart';

class CvBloc extends Bloc<CvEvent, CvState> {
  final servicelocator = DataLayer().locator.get<DataBase>();
  CvBloc() : super(CvInitial()) {
    on<CvEvent>((event, emit) {

    });
     on<FetchEvent>(getdata);
      on<AddEvent>(adddata);
      on<DeletEvent>(removeData);
       on<EditEvent>(editData);
  }
FutureOr<void> getdata(FetchEvent event,emit)async{
    emit(DisplayState(await servicelocator.fetchCV()));
  }
  FutureOr<void> adddata(AddEvent event,emit)async{
    await servicelocator.insertCV(event.cv);
    emit(DisplayState(await servicelocator.fetchCV()));
  }
  
  
  FutureOr<void> removeData(DeletEvent event, Emitter<CvState> emit)async{
    await servicelocator.deletCV(event.cvId as CV);
  
    emit(DisplayState(await servicelocator.fetchCV()));
  }
Future<void> editData(EditEvent event,emit) async {
    await servicelocator.updateCV(event.cv);
    emit(DisplayState(await servicelocator.fetchCV()));
  }
}
