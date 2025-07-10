part of 'add_note_cubit.dart';

@immutable
abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteSucccess extends AddNoteState {}

class AddNoteFailure extends AddNoteState {
  final String errMessage;
  AddNoteFailure(this.errMessage);
}
/*
دي انا بستخدمها في كيوبت بتبقي خطوات معينه يعني مثلا عندي ف الاول ان هيبقي في داتا
 التاني اثناء التحميل التالت لو نجح الرابع لو فشل 
ودول اساسي في الكيوبت ده 
*/


