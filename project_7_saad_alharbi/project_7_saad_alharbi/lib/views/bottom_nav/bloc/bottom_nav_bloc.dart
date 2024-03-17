import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:project_7_saad_alharbi/data_layer/home_data_layer.dart';
import 'package:project_7_saad_alharbi/service/supabase_services.dart';
import 'package:project_7_saad_alharbi/views/resume/resume_page.dart';
import 'package:project_7_saad_alharbi/views/home/home_page.dart';
import 'package:project_7_saad_alharbi/views/profile/profile_page.dart';

part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  int currentIndex = 0;
  List<Widget> pages = [
    HomePage(),
    ResumePage(),
    ProfilePage(),
  ];
  BottomNavBloc() : super(BottomNavInitial()) {
    on<BottomNavEvent>((event, emit) {});
    on<ChangePageEvent>((event, emit) {
      currentIndex = event.indexPage;
      emit(ChangePageState());
    });
    on<LogoutEvent>((event, emit) async {
      await DBService().logOut();
      GetIt.I.get<HomeData>().removeToken();
    });
  }
}
