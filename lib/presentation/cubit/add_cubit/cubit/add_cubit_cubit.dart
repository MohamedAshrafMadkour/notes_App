import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/presentation/constant.dart';
import 'package:notes_app/presentation/model/note_model.dart';

part 'add_cubit_state.dart';

class AddCubitCubit extends Cubit<AddCubitState> {
  AddCubitCubit() : super(AddCubitInitial());
  Color color = const Color(0xffBFAE48);

  addNotes(NoteModel note) async {
    note.color = color.toARGB32();
    emit(AddCubitLoading());
    try {
      var noteBox = Hive.box<NoteModel>(kPrimaryBox);
      await noteBox.add(note);
      emit(AddCubitSuccess());
    } catch (e) {
      emit(
        AddCubitError(
          error: e.toString(),
        ),
      );
    }
  }
}
