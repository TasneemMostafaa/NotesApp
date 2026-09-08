import 'package:flutter/material.dart';
import 'package:notesapp/view/widgets/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, this.isLoading = false});

  final void Function()? onTap;
  final isLoading;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: kPrimaryColor,
        ),
        child: Center(
          child: isLoading ? SizedBox(
            height: 25, width: 25,
            child: const CircularProgressIndicator(color: Colors.black,)) : Text("Add", style: TextStyle(color: Colors.black, fontSize: 16,),),
        ),
      ),
    );
  }
}