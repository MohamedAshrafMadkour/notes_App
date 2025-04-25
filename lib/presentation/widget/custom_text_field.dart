import 'package:flutter/material.dart';
import 'package:notes_app/presentation/constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.maxLines,
    required this.hintText,
    this.onSaved,
    this.onChanged,
  });
  final Function(String)? onChanged;
  final int maxLines;
  final String hintText;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'field is required';
        } else {
          return null;
        }
      },
      onSaved: onSaved,
      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: outlineBorder(),
        focusedBorder: outlineBorder(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder outlineBorder([color]) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color ?? Colors.white),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
