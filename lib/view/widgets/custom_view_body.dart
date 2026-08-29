import 'package:flutter/material.dart';
import 'package:notesapp/view/widgets/custom_app_bar.dart';

class CustomViewBody extends StatelessWidget {
  const CustomViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: const Column(
        children: [
          SizedBox(height: 40,),
          CustomAppBar(),
        ],
      ),
    );
  }
}