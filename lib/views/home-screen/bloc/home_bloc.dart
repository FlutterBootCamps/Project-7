
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project7/data_layer/data.dart';
import 'package:project7/services/database.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<LogOutEvent>((event, emit) async {
      await DBService().logOut();
      await HomeData().removeToken();


   

    });
       

       on<InsertRowEvent>(
      (event, emit) async {
        await DBService().insertData(event.name, event.summary,event.education,event.experience,event.skills,event.languages);
      },
    );
  
  }
}

