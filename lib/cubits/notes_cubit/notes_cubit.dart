import 'package:bloc/bloc.dart';
import 'package:hive_ce/hive.dart';
import 'package:meta/meta.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/view/widgets/constants.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel> ?notes;
  
  fetchAll(){
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
    emit(NotesSuccess());
    
  }
  search(String value){
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    List<NoteModel> allNotes= notesBox.values.toList();

    List<NoteModel> filteredNotes =[];

    if(value.isEmpty){
      notes=allNotes;
      emit(NotesSuccess());
      return;
      //we are done here don't go to the filteration code
    }

    for(var note in allNotes){
      if(note.title.toLowerCase().contains(value.toLowerCase())){
        filteredNotes.add(note);
      }
    }
    notes=filteredNotes;
    emit(NotesSearching());
  }
}
