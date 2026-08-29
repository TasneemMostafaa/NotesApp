import 'package:flutter/material.dart';
import 'package:notesapp/view/widgets/custom_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const CustomViewBody(),
    );
  }
}