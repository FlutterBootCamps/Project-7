import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project7/model/cv_model.dart';
import 'package:project7/services/database.dart';

part 'edit_event.dart';
part 'edit_state.dart';

class EditBloc extends Bloc<EditEvent, EditState> {
  EditBloc() : super(EditInitial()) {
    on<EditEvent>((event, emit) {
    });
        on<EditDataEvent>(edit);

  }

 
}
FutureOr<void> edit(EditDataEvent event, Emitter<EditState> emit) async {
  await DBService().updateData(
      name: event.name,
      summary: event.summary,
      education: event.education,
      experience: event.experience,
      skills: event.skills,
      languages: event.languages,
      );
      emit(DisplayEditState(classCv: await DBService().fetchCV()));

  
}
