import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/presentation/constant.dart';
import 'package:notes_app/presentation/model/note_model.dart';

part 'display_notes_state.dart';

class DisplayNotesCubit extends Cubit<DisplayNotesState> {
  DisplayNotesCubit() : super(DisplayNotesInitial());
  List<NoteModel>? notes;
  displayNotes() {
    var noteBox = Hive.box<NoteModel>(kPrimaryBox);
    notes = noteBox.values.toList();
    emit(DisplayNotesSuccess());
  }
}
