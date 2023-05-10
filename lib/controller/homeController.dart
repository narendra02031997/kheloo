import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  final CarouselController controller = CarouselController();
  int current = 0;
  bool showMore = false;
  String jackpotNumber = "8947475";

  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      jackpotNumber = (int.parse(jackpotNumber) + 1).toString();
      update();
    });
  }


}