import 'package:flutter/material.dart';
import 'package:notesapp/view/widgets/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hint, this.maxLines = 1, this.onSaved});


  final String hint;
  final int maxLines;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if(value ! .isEmpty){
          return "Field is required";
        }
        else{
          return null;
        }
      },
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(kPrimaryColor),
        
      ),
    );
  }

  OutlineInputBorder buildBorder([Color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.white)
      );
  }
}