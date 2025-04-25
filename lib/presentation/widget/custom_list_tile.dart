import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/presentation/cubit/notes_cubit/cubit/display_notes_cubit.dart';
import 'package:notes_app/presentation/model/note_model.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile({
    super.key,
    required this.noteModel,
  });
  final NoteModel noteModel;

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.noteModel.title,
        style: const TextStyle(
          fontSize: 24,
          color: Colors.black,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 20,
        ),
        child: Opacity(
          opacity: .4,
          child: Text(
            widget.noteModel.subTitle,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          widget.noteModel.delete();
          BlocProvider.of<DisplayNotesCubit>(context).displayNotes();
        },
        icon: const Icon(
          FontAwesomeIcons.trash,
        ),
        color: Colors.black,
      ),
    );
  }
}
