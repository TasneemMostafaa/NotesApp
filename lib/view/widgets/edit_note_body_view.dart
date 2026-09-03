import 'package:flutter/material.dart';
import 'package:notesapp/view/widgets/custom_app_bar.dart';

class EditNoteBodyView extends StatelessWidget {
  const EditNoteBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
       padding: const EdgeInsets.symmetric(horizontal: 16),
       child: Column(
        children: const[
           SizedBox(height: 35,),
           CustomAppBar(title: "Edit Notes", icon: Icon(Icons.check)),
        ],
       ),
    );
  }
}