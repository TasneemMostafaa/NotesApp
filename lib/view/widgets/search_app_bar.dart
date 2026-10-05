import 'package:flutter/material.dart';
import 'package:notesapp/view/widgets/custom_icon.dart';
import 'package:notesapp/view/widgets/custom_text_field.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({super.key, required this.onClosed});
  final VoidCallback onClosed;

  @override
  Widget build(BuildContext context) {
    return  Row(
            children: [
              Expanded(child: CustomTextFormField(hint: "search...",
              onChanged:(value){

              },),
              ),
              CustomIcon(icon: const Icon(Icons.close), onPressed:
                onClosed
                )
              ,
            ],
          );
  }
  }
