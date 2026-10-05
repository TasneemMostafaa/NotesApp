import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:notesapp/view/widgets/custom_app_bar.dart';
import 'package:notesapp/view/widgets/custom_icon.dart';
import 'package:notesapp/view/widgets/custom_text_field.dart';
import 'package:notesapp/view/widgets/note_item.dart';
import 'package:notesapp/view/widgets/notes_list_view.dart';
import 'package:notesapp/view/widgets/search_app_bar.dart';

class CustomViewBody extends StatefulWidget {
  const CustomViewBody({super.key});

  @override
  State<CustomViewBody> createState() => _CustomViewBodyState();
}

class _CustomViewBodyState extends State<CustomViewBody> {
  bool isSearching = false;
  @override
  void initState() {
   BlocProvider.of<NotesCubit>(context).fetchAll();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 35,),
          isSearching ?SearchAppBar(onClosed: (){
            setState(() {
            isSearching = false;
          });}) : 
          CustomAppBar(title: "Notes", icon: const Icon(Icons.search), onPressed: (){
            setState(() {
              isSearching=true;
            });
          }),
          const Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}
