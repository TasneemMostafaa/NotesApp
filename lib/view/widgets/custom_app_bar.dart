import 'package:flutter/material.dart';
import 'package:notesapp/view/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.icon, required this.title});

  final String title;
  final Icon icon;


  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text( title , style: TextStyle(fontSize: 24),),
        Spacer(),
        CustomIcon(icon:icon),
      ],
    );
  }
}
