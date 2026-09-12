import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/view/widgets/custom_app_bar.dart';
import 'package:notesapp/view/widgets/custom_text_field.dart';
import 'package:notesapp/view/widgets/custom_view_body.dart';
import 'package:notesapp/view/widgets/edit_note_colors_list.dart';

class EditNoteBodyView extends StatefulWidget {
  const EditNoteBodyView({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteBodyView> createState() => _EditNoteBodyViewState();
}

class _EditNoteBodyViewState extends State<EditNoteBodyView> {
  String ? title, subtitle;

  
  @override
  Widget build(BuildContext context) {
    return  Padding(
       padding: const EdgeInsets.symmetric(horizontal: 16),
       child: Column(
        children: [
          const SizedBox(height: 35,),
           CustomAppBar(title: "Edit Notes", icon: Icon(Icons.check),
           onPressed: () {
            widget.note.title = title ?? widget.note.title;
            widget.note.subtitle = subtitle ?? widget.note.subtitle;
            widget.note.save();
            BlocProvider.of<NotesCubit>(context).fetchAll();
            Navigator.pop(context);
           },),
           const SizedBox(height: 50,),
           CustomTextFormField(hint: widget.note.title,
            onChanged: (value){
              title = value;
           },),
           const SizedBox(height: 16,),
           CustomTextFormField(hint:widget.note.subtitle,maxLines: 5,onChanged:(value){
            subtitle = value;
           } ,),

           EditNoteColorsList(note: widget.note),
        ],
       ),
    );
  }
}