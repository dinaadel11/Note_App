import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String titel;
  @HiveField(1)
  String subtitel;
  @HiveField(2)
  final String date;
  @HiveField(3)
  int color;
  NoteModel(
      {required this.titel,
      required this.subtitel,
      required this.date,
      required this.color});
}
