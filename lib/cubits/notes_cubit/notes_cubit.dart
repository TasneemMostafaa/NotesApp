import 'package:bloc/bloc.dart';
import 'package:hive_ce/hive.dart';
import 'package:meta/meta.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/view/widgets/constants.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());


  fetchAll(){
    try{
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    List <NoteModel> notes = notesBox.values.toList();
    emit(NotesSuccess(notes));
    } catch(e){
      emit(NotesFailure(toString()));
    }
  }
}
