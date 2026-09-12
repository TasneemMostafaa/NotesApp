import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/add_note_cubit/add_note_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isPicked, required this.color});
  final bool isPicked;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isPicked ? 
    CircleAvatar(
      radius: 20,
      backgroundColor: Colors.white,
      child:  CircleAvatar(
        radius: 18,
        backgroundColor: color,
      ),
    )
    :  CircleAvatar(
      radius: 18,
      backgroundColor: color,
    );
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentIndex=0;
  List<Color> colorList = const [
    Color(0xFFF3C6CC),
    Color(0xFF8CB0BC),
    Color(0xFFAFDCEB),
    Color(0xFF91ABC9),
    Color(0xFF3D6891),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        itemCount: colorList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, Index){
        return  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: GestureDetector(
            onTap: () {
              currentIndex =Index;
              BlocProvider.of<AddNoteCubit>(context).color = colorList[Index];
              setState(() {
                
              });
            },
            child: ColorItem(isPicked: currentIndex == Index,
            color: colorList[Index],)),
        );
      }),
    );
  }
}
