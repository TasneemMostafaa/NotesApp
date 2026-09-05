import 'package:flutter/material.dart';
import 'package:notesapp/view/widgets/custom_button.dart';
import 'package:notesapp/view/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: addNoteForm(),
      ),
    );
  }
}

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