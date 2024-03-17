import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:try_auth_suba/api/serves.dart';
import 'package:try_auth_suba/model/cv_model.dart';
import 'package:try_auth_suba/setup/git_it.dart';

part 'member_event.dart';
part 'member_state.dart';

class MemberBloc extends Bloc<MemberEvent, MemberState> {
  MemberBloc() : super(MemberInitial()) {
    on<MemberEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<gitDataEvent>((event, emit) async{
      final servesLocator =gitIt().locator.get<Serves>();
List x=await servesLocator.getCv();
      //ALL CVs
      emit(MemberShow(x));
    },);
        on<addMember>((event, emit) async{
      final servesLocator =gitIt().locator.get<Serves>();
      await servesLocator.insertCv(event.cv);
      emit(MemberShow(await servesLocator.getCVOfUser()));
    },);
    //         on<deleteMember>((event, emit) async{
    //   final servesLocator =gitIt().locator.get<serves>();
    //   await servesLocator.deleteNoteData(event.id);
    //   emit(MemberShow(await servesLocator.getNote()));
    // },);on<updateMember>((event, emit) async{
    //   final servesLocator =gitIt().locator.get<serves>();
    //   await servesLocator.updateData(event.id,event.name);
    //   emit(MemberShow(await servesLocator.getNote()));
    // },);
  }
}
