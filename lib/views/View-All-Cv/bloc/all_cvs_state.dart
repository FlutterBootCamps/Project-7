part of 'all_cvs_bloc.dart';

@immutable
sealed class AllCvsState {}

final class AllCvsInitial extends AllCvsState {}
class seccessState extends AllCvsState{
List<CV> cv =[];
seccessState(this.cv);
}

class LoadingState extends AllCvsState{}
