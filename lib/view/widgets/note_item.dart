import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/view/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({required this.noteColor, required this.note});
  final noteColor;
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder:(context){ return EditNoteView();}));
      },
      child: Container(
        padding: EdgeInsets.only(top: 24, bottom: 24,right: 14, left: 24),
        decoration: BoxDecoration(
          color: noteColor,
          borderRadius: BorderRadius.circular(16),
          
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(note.title, style: TextStyle(color: Colors.black, fontSize: 22)),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(note.subtitle,style: TextStyle(color: Colors.black.withAlpha(120), fontSize: 16) ),
                ),
                trailing: IconButton(onPressed: (){note.delete();
                }
                , icon:Icon(FontAwesomeIcons.trash, color: Colors.black,size: 20,) ),
              ),
              
              Padding(
                padding: const EdgeInsets.only(right: 14),
                child: Text(note.date, style: TextStyle(color: Colors.black.withAlpha(120), fontSize: 12),),
              )
            ],
      
          ),
        
      ),
    );
  }
}