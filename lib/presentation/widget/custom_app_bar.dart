import 'package:flutter/material.dart';
import 'package:notes_app/presentation/widget/custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.textBar, required this.icon, this.onPressed});
  final String textBar;
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          textBar,
          style: const TextStyle(fontSize: 28),
        ),
        const Spacer(),
        CustomSearchIcon(
          icon: icon,
          onPressed: onPressed,
        )
      ],
    );
  }
}
