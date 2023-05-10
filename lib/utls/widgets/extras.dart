import 'package:flutter/cupertino.dart';

height(BuildContext context){
  return MediaQuery.of(context).size.height;
}width(BuildContext context){
  return MediaQuery.of(context).size.width;
}

Widget spaceHeight(double height){
  return SizedBox(height: height,);
}

Widget spaceWidth(double width){
  return SizedBox(width: width,);
}
