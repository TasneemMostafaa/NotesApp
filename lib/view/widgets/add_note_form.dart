import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/view/widgets/custom_button.dart';
import 'package:notesapp/view/widgets/custom_text_field.dart';

class addNoteForm extends StatefulWidget {
  const addNoteForm({
    super.key,
  });

  @override
  State<addNoteForm> createState() => _addNoteFormState();
}

class _addNoteFormState extends State<addNoteForm> {




  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String ? title, subtitle; 
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      
      child: Column(
        children: [
          const SizedBox(height: 45,), 
          CustomTextFormField(hint: "Title",
          onSaved: (value){
            title= value;
          },),
          const SizedBox(height: 16,),
          CustomTextFormField(hint: "Content", maxLines: 5,
          onSaved: (value){
            subtitle = value;
          },),
          const SizedBox(height: 32,),
          CustomButton(
            onTap: () {
              if(formKey.currentState!.validate()){
                formKey.currentState!.save();
                var notemodel = NoteModel(title: title !, subtitle: subtitle !, date: DateTime.now().toString(),
                 color: Color(0xFFAFDCEB).toARGB32());
                BlocProvider.of<AddNoteCubit>(context).addNote(notemodel);
              }
              else{
                autovalidateMode = AutovalidateMode.always;
              }
              setState(() {
                
              });
            },
          ),
          SizedBox(height: 16,),
      
        ],
      ),
    );
  }
}