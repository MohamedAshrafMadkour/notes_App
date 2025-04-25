import 'package:flutter/material.dart';
import 'package:notes_app/presentation/model/note_model.dart';
import 'package:notes_app/presentation/widget/custom_edit_container.dart';

class EditView extends StatelessWidget {
  const EditView({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return CustomEditContainer(
      note: note,
    );
  }
}
