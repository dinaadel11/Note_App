import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/models/note_model.dart';
import 'package:newsapp/notes_cubit/notes_cubit.dart';
import 'package:newsapp/views/widgets/custom_app_bar.dart';
import 'package:newsapp/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? titel, content;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            CustomAppBar(
              onPressed: () {
                widget.note.titel = titel ?? widget.note.titel;
                widget.note.subtitel = content ?? widget.note.subtitel;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
              titel: 'Edit',
              icon: Icons.check,
            ),
            const SizedBox(
              height: 60,
            ),
            CustomTextField(
                onChange: (value) {
                  titel = value;
                },
                hint: widget.note.titel),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              onChange: (value) {
                content = value;
              },
              hint: widget.note.subtitel,
              maxlines: 5,
            ),
          ],
        ));
  }
}
