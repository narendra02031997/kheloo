import 'package:flutter/material.dart';

Widget divider(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 150,
        height: 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Color(0xFFfdc600),
        ),
      ),
    ],
  );
}