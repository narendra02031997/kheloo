import 'package:flutter/material.dart';
import 'package:kheloo/utls/const/colors/colors.dart';

Widget shadeMaskText(String text){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ShaderMask(
        shaderCallback: (bounds) => LinearGradient(
          colors: [Color(0xFFFFD370), white],
          stops: [0.0, 0.5],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(bounds),
        blendMode: BlendMode.srcIn,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 25,
            letterSpacing: -1.5,
            height: 1,
            wordSpacing: 4,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}

Widget fontWhite({required String text,double size=15}){
  return  Text(
    text,
    style: TextStyle(
        color: white,
        fontSize: size,
        fontWeight: FontWeight.bold),
  );
}