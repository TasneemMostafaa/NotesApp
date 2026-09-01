import 'package:flutter/material.dart';
import 'package:notesapp/view/widgets/custom_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){},
      child: Icon(Icons.add),
      backgroundColor: Color(0xFF161616),),
      body: const CustomViewBody(),
    );
  }
}