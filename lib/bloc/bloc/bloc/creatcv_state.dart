part of 'creatcv_bloc.dart';

@immutable
sealed class CreatcvState {}

final class CreatcvInitial extends CreatcvState {}

class DisplayInfoState extends CreatcvState{
  
  final UserDataModel? user;
  DisplayInfoState({  this.user});
}

class ErrorState extends CreatcvState {

}
