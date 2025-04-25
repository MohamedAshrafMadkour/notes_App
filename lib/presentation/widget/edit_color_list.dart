import 'package:flutter/material.dart';
import 'package:notes_app/presentation/constant.dart';
import 'package:notes_app/presentation/model/note_model.dart';
import 'package:notes_app/presentation/widget/color_list.dart';

class EditColorList extends StatefulWidget {
  const EditColorList({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditColorList> createState() => _EditColorListState();
}

class _EditColorListState extends State<EditColorList> {
  @override
  void initState() {
    currentIndex = kColorList.indexOf(Color(widget.note.color));
    super.initState();
  }

  late int currentIndex;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColorList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                widget.note.color = kColorList[index].toARGB32();
                setState(() {});
              },
              child: ColorItem(
                isActive: currentIndex == index,
                color: kColorList[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
