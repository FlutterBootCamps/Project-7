import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:project7/service/data_base.dart';
import 'package:project7/service/db.dart';

import '../../../model/user_data.dart';

part 'creatcv_event.dart';
part 'creatcv_state.dart';

class CreatcvBloc extends Bloc<CreatcvEvent, CreatcvState> {
  final locator = GetIt.I.get<DBService>();
  CreatcvBloc() : super(CreatcvInitial()) {

     on<FetchDataEvent>((event, emit) async{
      final servel = DataInjection().locator.get<DBService>();
      try {
        UserDataModel user = await servel.fetchCvData();
        emit(DisplayInfoState( user:user));
      } catch (e) {
        print(e);
        emit(ErrorState());
      }
     
    },);

    on<CreateInfoEvent>((event, emit)async {
      final servel = DataInjection().locator.get<DBService>();
      try {
        var user= await servel.createData(res: event.cv);
      
      emit(DisplayInfoState(user: user ));
      }catch(e){
        print(e);
        emit(ErrorState());
        
      }
     
    });
  }
}
