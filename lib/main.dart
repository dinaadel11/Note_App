import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newsapp/addnotecuibit/add_note_cubit.dart';
import 'package:newsapp/constrain.dart';
import 'package:newsapp/models/note_model.dart';
import 'package:newsapp/simple_bloc_observer.dart';
import 'package:newsapp/views/notes_view.dart';

// void main() async => runApp(
//       DevicePreview(
//         enabled: !kReleaseMode,
//         builder: (context) => NoteApp(), // Wrap your app
//       ),
// //     );
// void main() async {
//   await Hive.initFlutter();
//   await Hive.openBox(kNotesBox);
//   runApp(NoteApp());
// }
void main() async {
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // ممكن تفتحي Box هنا لو حابة
  await Hive.openBox(kNotesBox);
  Hive.registerAdapter(NoteModelAdapter());

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
          BlocProvider(create: (context) => AddNoteCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          home: const NotesView(),
        ));
  }
}
