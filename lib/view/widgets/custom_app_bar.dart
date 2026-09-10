import 'package:flutter/material.dart';
import 'package:notesapp/view/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.icon, required this.title, this.onPressed});

  final String title;
  final Icon icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text( title , style: TextStyle(fontSize: 24),),
        Spacer(),
        CustomIcon(icon:icon, onPressed: onPressed,),
      ],
    );
  }
}
