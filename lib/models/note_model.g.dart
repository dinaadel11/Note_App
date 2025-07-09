part of 'note_model.dart';

class NoteModelAdapter extends TypeAdapter<NoteModel> {
  final int typeId = 0;
  NoteModel read(BinaryReader reader) {
    final numofFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numofFields; i++) reader.readByte(): reader.read(),
    };
    return NoteModel(
        titel: fields[0] as String,
        subtitel: fields[1] as String,
        date: fields[2] as String,
        color: fields[3] as int);
  }

  void write(BinaryWriter writer, NoteModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.titel)
      ..writeByte(1)
      ..write(obj.subtitel)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.color);
  }

  int get hashCode => typeId.hashCode;
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
