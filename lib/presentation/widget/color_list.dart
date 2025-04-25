import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/presentation/constant.dart';
import 'package:notes_app/presentation/cubit/add_cubit/cubit/add_cubit_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.isActive,
    required this.color,
  });
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(6),
            child: CircleAvatar(
              radius: 42,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 42,
            backgroundColor: color,
          );
  }
}

class ColorItemsList extends StatefulWidget {
  const ColorItemsList({super.key});

  @override
  State<ColorItemsList> createState() => _ColorItemsListState();
}

class _ColorItemsListState extends State<ColorItemsList> {
  int currentIndex = 0;

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
                BlocProvider.of<AddCubitCubit>(context).color =
                    kColorList[index];
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
