import 'package:flutter/material.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/view/widgets/color_list_view.dart';
import 'package:notesapp/view/widgets/constants.dart';

class EditNoteColorsList extends StatefulWidget {
  const EditNoteColorsList({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
  late int currentIndex;
  

  initState(){
      currentIndex= kColors.indexOf(Color(widget.note.color));
    }
  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: 40,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, Index){
        return  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: GestureDetector(
            onTap: () {
              currentIndex =Index;
              // ignore: deprecated_member_use
              widget.note.color = kColors[Index].value;
              setState(() {
                
              });
            },
            child: ColorItem(isPicked: currentIndex == Index,
            color: kColors[Index],)),
        );
      }),
    );
  }
}