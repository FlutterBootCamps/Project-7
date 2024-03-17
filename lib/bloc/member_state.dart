part of 'member_bloc.dart';

@immutable
sealed class MemberState {}

final class MemberInitial extends MemberState {}

final class MemberShow extends MemberState {
  List listMember;
  MemberShow(this.listMember);
}
