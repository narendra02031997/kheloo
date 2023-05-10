import 'package:flutter/cupertino.dart';
import 'package:kheloo/utls/const/assets/assets.dart';
import 'package:kheloo/utls/const/colors/colors.dart';
import 'package:kheloo/utls/widgets/extras.dart';

Widget withdrawlWidget() {
  return Container(
    height: 40,
    child: Row(
      children: [
        Container(
          height: 40,
          width: 40,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(width: 3, color: Color(0xffd57f23)),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Image.asset(
            ASSETS.USER,
          ),
        ),
        spaceWidth(5),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Jay',
                    style: TextStyle(
                        color: white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  spaceWidth(2),
                  Text(
                    "₹",
                    style: TextStyle(
                        color: Color(0xfff4ad09),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '31920',
                    style: TextStyle(
                        color: white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                '10 second ago',
                style: TextStyle(
                    color: white, fontSize: 10, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
