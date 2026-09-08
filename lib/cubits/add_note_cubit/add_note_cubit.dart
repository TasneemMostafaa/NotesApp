import 'package:bloc/bloc.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/view/widgets/constants.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());



  addNote(NoteModel note)async{
    emit(AddNoteLoading());
    try{
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    await notesBox.add(note);
    emit(AddNoteSuccess());
    } catch(e){
      emit(AddNoteFailure(toString()));
    }
    
  }
}

