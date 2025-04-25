import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:notes_app/presentation/cubit/add_cubit/cubit/add_cubit_cubit.dart';
import 'package:notes_app/presentation/cubit/notes_cubit/cubit/display_notes_cubit.dart';
import 'package:notes_app/presentation/widget/add_form.dart';
import 'package:notes_app/presentation/widget/snake_bar_show.dart';

class NotesShow extends StatelessWidget {
  const NotesShow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCubitCubit(),
      child: BlocConsumer<AddCubitCubit, AddCubitState>(
        listener: (context, state) {
          if (state is AddCubitSuccess) {
            BlocProvider.of<DisplayNotesCubit>(context).displayNotes();
            return Navigator.pop(context);
          } else if (state is AddCubitError) {
            return snakeBarShow(context, 'operation is failure');
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddCubitLoading ? true : false,
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: SingleChildScrollView(child: AddForm()),
            ),
          );
        },
      ),
    );
  }
}
