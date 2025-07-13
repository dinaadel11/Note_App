import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newsapp/addnotecuibit/add_note_cubit.dart';
import 'package:newsapp/constrain.dart';
import 'package:newsapp/models/note_model.dart';
import 'package:newsapp/notes_cubit/notes_cubit.dart';
import 'package:newsapp/simple_bloc_observer.dart';
import 'package:newsapp/views/notes_view.dart';

void main() async {
  // Initialize Hive
  await Hive.initFlutter();
  Bloc.observer =
      SimpleBlocObserver(); //دي بتوفر عليا عمليه ال debuge  ودي كمان اللي بتظهر العمليات في ال debug console

  Hive.registerAdapter(NoteModelAdapter());
  // ممكن تفتحي Box هنا لو حابة
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(
    DevicePreview(
      enabled: true, // خليها false لما تخلصي testing
      builder: (context) => const NoteApp(), // Wrap your app
    ),
  );
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AddNoteCubit()),
        BlocProvider(create: (_) => NotesCubit()..fetchAllNotes()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const NotesView(),
      ),
    );
  }
}
