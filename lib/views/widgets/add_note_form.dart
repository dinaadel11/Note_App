import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/addnotecuibit/add_note_cubit.dart';
import 'package:newsapp/models/note_model.dart';
import 'package:newsapp/notes_cubit/notes_cubit.dart';
import 'package:newsapp/views/widgets/custom_button.dart';
import 'package:newsapp/views/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? titel, subtitel;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formkey,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            onsaved: (value) {
              titel = value;
            },
            hint: 'Titel',
            maxlines: 1,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onsaved: (value) {
              subtitel = value;
            },
            hint: 'content',
            maxlines: 5,
          ),
          const SizedBox(
            height: 120,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                  isloading: state is AddNoteLoading ? true : false,
                  ontap: () {
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                      var currentDate = DateTime.now();
                      var formatedcurrentdata =
                          DateFormat.Hms().format(currentDate);
                      var notemodel = NoteModel(
                          titel: titel!,
                          subtitel: subtitel!,
                          date: formatedcurrentdata,
                          color: Colors.red.value);
                      BlocProvider.of<AddNoteCubit>(context)
                          .addNote(notemodel)
                          .then((_) {
                        BlocProvider.of<NotesCubit>(context)
                            .fetchAllNotes(); // ⬅️ دي مهمة
                        Navigator.pop(context);
                      });
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  });
            },
          ),
          const SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }
}
