import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/presentation/cubit/notes_cubit/cubit/display_notes_cubit.dart';
import 'package:notes_app/presentation/model/note_model.dart';
import 'package:notes_app/presentation/widget/custom_app_bar.dart';
import 'package:notes_app/presentation/widget/custom_text_field.dart';
import 'package:notes_app/presentation/widget/edit_color_list.dart';

class CustomEditContainer extends StatefulWidget {
  const CustomEditContainer({
    super.key,
    required this.note,
  });
  final NoteModel note;
  @override
  State<CustomEditContainer> createState() => _CustomEditContainerState();
}

class _CustomEditContainerState extends State<CustomEditContainer> {
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            CustomAppBar(
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = subTitle ?? widget.note.subTitle;
                widget.note.save();
                BlocProvider.of<DisplayNotesCubit>(context).displayNotes();
                Navigator.of(context).pop();
              },
              textBar: 'Edit Notes',
              icon: Icons.check,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextField(
                onChanged: (value) {
                  title = value;
                },
                maxLines: 1,
                hintText: widget.note.title),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
                onChanged: (value) {
                  subTitle = value;
                },
                maxLines: 5,
                hintText: widget.note.subTitle),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: EditColorList(note: widget.note),
            ),
          ],
        ),
      ),
    );
  }
}
