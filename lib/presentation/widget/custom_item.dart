import 'package:flutter/material.dart';

import 'package:notes_app/presentation/model/note_model.dart';
import 'package:notes_app/presentation/view/edit_view.dart';
import 'package:notes_app/presentation/widget/custom_list_tile.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({
    super.key,
    required this.noteModel,
  });
  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditView(
                note: noteModel,
              );
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(noteModel.color.toInt()),
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomListTile(
              noteModel: noteModel,
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 24,
                bottom: 16,
              ),
              child: Opacity(
                opacity: .4,
                child: Text(
                  noteModel.date,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
