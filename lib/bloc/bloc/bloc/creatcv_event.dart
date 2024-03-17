part of 'creatcv_bloc.dart';

@immutable
sealed class CreatcvEvent {}

class FetchDataEvent extends CreatcvEvent{}

class CreateInfoEvent extends CreatcvEvent{
final UserDataModel cv;
  CreateInfoEvent({required this.cv});
}