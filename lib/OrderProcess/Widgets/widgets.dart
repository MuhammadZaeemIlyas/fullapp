import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';

class CustomTextfield extends StatefulWidget {
  final String title;

  const CustomTextfield({super.key, required this.title});

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultText(text: widget.title, color: AppColors.black100, size: 15),
          TextField(
            decoration: InputDecoration(focusColor: AppColors.blue),
          )
        ],
      ),
    );
  }
}

class RowField extends StatefulWidget {
  const RowField({super.key});

  @override
  State<RowField> createState() => _RowFieldState();
}

class _RowFieldState extends State<RowField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultText(text: "Heelo", color: AppColors.black100, size: 15),
          TextField(
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          )
        ],
      ),
    );
  }
}
