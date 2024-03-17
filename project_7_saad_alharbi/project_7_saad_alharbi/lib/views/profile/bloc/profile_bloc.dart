import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_7_saad_alharbi/model/user_info_model.dart';
import 'package:project_7_saad_alharbi/service/supabase_services.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {});
    on<ProfileLoadEvent>(methodLoadProfile);
  }

  FutureOr<void> methodLoadProfile(
      ProfileLoadEvent event, Emitter<ProfileState> emit) async {
    var user = await DBService().getUser();
    emit(ProfileLoadState(user: user));
  }
}
