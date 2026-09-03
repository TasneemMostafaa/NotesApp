import 'package:flutter/material.dart';
import 'package:notesapp/view/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
   const NotesListView({super.key});

  final List <Color> colorList = const [Color(0xFFAFDCEB), Color(0xFFCAE9F5),
   Color(0xFF77ACC5), Color(0xFFADD8E6), Color(0xFF86C5D8)];
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical:8),
      child: ListView.builder(
        padding: EdgeInsetsGeometry.zero
        ,itemBuilder: (context, index) {
        Color assignedColor = colorList[index % colorList.length];
        return Padding(
        padding:EdgeInsets.symmetric(vertical: 4),
         child:NoteItem(noteColor: assignedColor ),);
         },),
    );
  }
}