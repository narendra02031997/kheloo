import 'package:flutter/material.dart';
import 'package:kheloo/utls/const/assets/assets.dart';
import 'package:kheloo/utls/const/colors/colors.dart';
import 'package:kheloo/utls/const/strings.dart';
import 'package:kheloo/utls/widgets/extras.dart';

AppBar appBar(){
  return AppBar(
    leading: Image.asset(ASSETS.LOGO),
    leadingWidth: 150,
    backgroundColor: black,
    elevation: 0,
    actions: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ASSETS.GIFT,
            height: 25,
            width: 25,
          ),
          Text(
            PROMOTIONS,
            style: TextStyle(
                fontSize: 10,
                color: fontColorHeader,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      spaceWidth(10),
      Container(
        width: 80,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFFFD370),
                Color(0xFFF7AD07),
              ],
              stops: [
                0.0,
                0.5,
              ],
            )),
        child: Center(
          child: Text(
            LOGIN,
            style: TextStyle(
                color: white, fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      )
    ],
  );
}