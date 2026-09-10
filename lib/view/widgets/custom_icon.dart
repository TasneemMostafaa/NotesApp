import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key,required this.icon, this.onPressed});

  final Icon icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {

    return Container(

      width: 50, height: 50,
      decoration: BoxDecoration(
      color: Colors.grey.withValues(alpha: 0.15),
      borderRadius: BorderRadius.circular(16),
      ),
      child: IconButton(onPressed: onPressed, icon: icon),
    );
  }
}