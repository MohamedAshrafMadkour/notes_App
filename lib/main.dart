import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/presentation/constant.dart';
import 'package:notes_app/presentation/cubit/notes_cubit/cubit/display_notes_cubit.dart';
import 'package:notes_app/presentation/model/note_model.dart';
import 'package:notes_app/presentation/simple_bloc_provider.dart';
import 'package:notes_app/presentation/view/first_screen.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserve();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kPrimaryBox);

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DisplayNotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
        home: const MainScreen(),
      ),
    );
  }
}
