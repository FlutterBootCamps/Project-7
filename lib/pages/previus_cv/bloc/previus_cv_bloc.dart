import 'package:bloc/bloc.dart';
import 'package:cv_app/models/cv_model.dart';
import 'package:cv_app/services/data_service.dart';
import 'package:cv_app/services/setup.dart';
import 'package:meta/meta.dart';

part 'previus_cv_event.dart';
part 'previus_cv_state.dart';

class PreviusCvBloc extends Bloc<PreviusCvEvent, PreviusCvState> {
  PreviusCvBloc() : super(PreviusCvInitial()) {
    final servicelocater = DataInjection().locater.get<DataBase>();
    on<FetchPreviusEvent>((event, emit) async {
      emit(LoadingState());
      List<CvModel> cvlist = await servicelocater.fetcPreviusResumes();
      emit(SuccessState(cvlist));
    });
  }
}
