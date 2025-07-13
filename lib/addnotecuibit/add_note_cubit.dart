import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:newsapp/constrain.dart';
import 'package:newsapp/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      dynamic notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note); // ⬅️ الأول نضيف
      emit(AddNoteSucccess()); // ⬅️ بعدين ن emit النجاح
    } on Exception catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
