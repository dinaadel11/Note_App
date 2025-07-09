import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newsapp/constrain.dart';
import 'package:newsapp/views/notes_view.dart';

// void main() async => runApp(
//       DevicePreview(
//         enabled: !kReleaseMode,
//         builder: (context) => NoteApp(), // Wrap your app
//       ),
//     );
void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kNotesBox);
  runApp(NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const NotesView(),
    );
  }
}
