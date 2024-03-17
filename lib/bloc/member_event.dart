part of 'member_bloc.dart';

@immutable
sealed class MemberEvent {}

class gitDataEvent extends MemberEvent {
  
}
class addMember extends MemberEvent {
CV cv;
  addMember(this.cv);
}
class deleteMember extends MemberEvent {
  String id;
  deleteMember(this.id);
}
class updateMember extends MemberEvent {
  String id;
  String name;
  updateMember(this.id,this.name);
}
