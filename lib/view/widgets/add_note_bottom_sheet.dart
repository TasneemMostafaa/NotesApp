import 'package:flutter/material.dart';
import 'package:notesapp/view/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 45,), 
          CustomTextField(hint: "Title",),
          SizedBox(height: 16,),
          CustomTextField(hint: "Content", maxLines: 5,),
        ],
      ),
    );
  }
}