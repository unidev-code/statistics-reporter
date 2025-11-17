import 'package:flutter/material.dart';

Widget buildAppTextField(BuildContext context,{required String title, String? hint, TextEditingController? controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: Theme.of(context).textTheme.labelMedium),
      SizedBox(height: 8),
      Container(
        padding: EdgeInsets.only(left: 12, right: 12, top: 2, bottom: 2),
        decoration: BoxDecoration(
          border: BoxBorder.all(width: 1, color: Color(0xFFC1C5CC)),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            hintStyle: TextStyle(color: Color(0xFFC1C5CC)),
          ),
        ),
      ),
    ],
  );
}
