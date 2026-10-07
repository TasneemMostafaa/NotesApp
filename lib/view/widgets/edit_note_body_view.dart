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
  late TextEditingController titleContrller;
  late TextEditingController subtitleController;

  @override
  void initState() {
    // To exist note title and subtitle as editable text in the fields
    super.initState();
    titleContrller = TextEditingController(text: widget.note.title);
    subtitleController = TextEditingController(text: widget.note.subtitle);

  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
       padding: const EdgeInsets.symmetric(horizontal: 16),
       child: Column(
        children: [
          const SizedBox(height: 35,),
           CustomAppBar(title: "Edit Notes", icon: Icon(Icons.check),
           onPressed: () {
            //The left operand can't be null, so the right operand is never executed
            widget.note.title = titleContrller.text ;
            widget.note.subtitle = subtitleController.text;
            widget.note.save();
            BlocProvider.of<NotesCubit>(context).fetchAll();
            Navigator.pop(context);
           },),
           const SizedBox(height: 50,),
           CustomTextFormField(
            controller: titleContrller,
            //hint: widget.note.title,
            //onChanged: (value){
          //title = value; },
           ),
           const SizedBox(height: 16,),
           CustomTextFormField(
            maxLines: 5,
            controller: subtitleController,
            //hint:widget.note.subtitle,maxLines: 5,onChanged:(value){
           //subtitle = value;
          // } 
           ),
           const SizedBox(height:16),
           EditNoteColorsList(note: widget.note),
        ],
       ),
    );
  }
  @override
  void dispose() {
    
    // TODO: implement dispose
    
    titleContrller.dispose();
    subtitleController.dispose();
    super.dispose();
  }
}