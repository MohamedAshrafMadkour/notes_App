import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/presentation/cubit/notes_cubit/cubit/display_notes_cubit.dart';
import 'package:notes_app/presentation/model/note_model.dart';
import 'package:notes_app/presentation/widget/custom_item.dart';

class ItemListView extends StatefulWidget {
  const ItemListView({
    super.key,
  });

  @override
  State<ItemListView> createState() => _ItemListViewState();
}

class _ItemListViewState extends State<ItemListView> {
  @override
  void initState() {
    BlocProvider.of<DisplayNotesCubit>(context).displayNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayNotesCubit, DisplayNotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<DisplayNotesCubit>(context).notes ?? [];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: ListView.builder(
              itemCount: notes.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: CustomItem(
                    noteModel: notes[index],
                  ),
                );
              }),
        );
      },
    );
  }
}
