import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:notesapp/view/widgets/custom_app_bar.dart';
import 'package:notesapp/view/widgets/note_item.dart';
import 'package:notesapp/view/widgets/notes_list_view.dart';

class CustomViewBody extends StatefulWidget {
  const CustomViewBody({super.key});

  @override
  State<CustomViewBody> createState() => _CustomViewBodyState();
}

class _CustomViewBodyState extends State<CustomViewBody> {

   void initState() {
   BlocProvider.of<NotesCubit>(context).fetchAll();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: const Column(
        children: [
          SizedBox(height: 35,),
          CustomAppBar(title: "Notes", icon: Icon(Icons.search)),
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}