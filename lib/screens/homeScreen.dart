import 'dart:async';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kheloo/controller/homeController.dart';
import 'package:kheloo/utls/const/assets/assets.dart';
import 'package:kheloo/utls/const/colors/colors.dart';
import 'package:kheloo/utls/const/const.dart';
import 'package:kheloo/utls/const/strings.dart';
import 'package:kheloo/utls/widgets/appBar.dart';
import 'package:kheloo/utls/widgets/container.dart';
import 'package:kheloo/utls/widgets/extras.dart';
import 'package:kheloo/utls/widgets/player.dart';
import 'package:kheloo/utls/widgets/text.dart';
import 'package:kheloo/utls/widgets/withdrawlWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black38,
        appBar: appBar(),
        body: GetBuilder<HomeController>(
          builder: (controller) {
            return ListView(
              children: [
                CarouselSlider(
                  items: List.generate(
                      sliderList.length,
                      (index) => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                sliderList[index],
                                fit: BoxFit.fill,
                                width: width(context),
                                height: height(context) * 0.30,
                              ),
                            ],
                          )),
                  carouselController: controller.controller,
                  options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 1,
                      height: height(context) * 0.30,
                      reverse: false,
                      onPageChanged: (index, reason) {
                        controller.current = index;
                        controller.update();
                      }),
                ),
                spaceHeight(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: sliderList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () =>
                          controller.controller.animateToPage(entry.key),
                      child: Container(
                        width: 22.0,
                        height: controller.current == entry.key ? 4 : 2.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            color: controller.current == entry.key
                                ? commonYellow
                                : white.withOpacity(0.5)),
                      ),
                    );
                  }).toList(),
                ),
                spaceHeight(25),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(
                      ASSETS.STRIP,
                    ),
                    fit: BoxFit.fitHeight,
                  )),
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                        languageList.length + 1,
                        (index) => index == languageList.length
                            ? Icon(
                                Icons.more_horiz,
                                color: fontColor,
                              )
                            : Text(
                                languageList[index],
                                style: TextStyle(
                                    color: fontColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              )),
                  ),
                ),
                spaceHeight(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: width(context) * 0.80,
                      child: Stack(
                        children: [
                          Image.asset(
                            ASSETS.JACKPOT,
                            height: 140,
                            fit: BoxFit.fill,
                          ),
                          Center(
                            child: Column(
                              children: [
                                Container(
                                  height: 162,
                                  padding: EdgeInsets.only(left: 9),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: List.generate(
                                        controller.jackpotNumber.length,
                                        (index) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 4.8,
                                              ),
                                              child: Text(
                                                '${controller.jackpotNumber[index]}',
                                                style: TextStyle(
                                                    color: Color(0xffbe1e2d),
                                                    fontSize: 35,
                                                    letterSpacing: -1,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   height: 150,
                    //   width: width(context) * 0.80,
                    //   decoration: BoxDecoration(
                    //       color: Colors.pink,
                    //       image: DecorationImage(
                    //           image: AssetImage(ASSETS.JACKPOT),
                    //           fit: BoxFit.fitWidth)),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Container(
                    //         height: 70,
                    //         color: Colors.blue,
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           crossAxisAlignment: CrossAxisAlignment.center,
                    //           children: List.generate(
                    //               7,
                    //               (index) => Padding(
                    //                     padding: const EdgeInsets.symmetric(
                    //                         horizontal: 2.0),
                    //                     child: Text(
                    //                       '2',
                    //                       style: TextStyle(
                    //                           color: Color(0xffbe1e2d),
                    //                           fontSize: 40,
                    //                           fontWeight: FontWeight.bold),
                    //                     ),
                    //                   )),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
                spaceHeight(40),
                shadeMaskText(LIVE_WITHDRAWL),
                spaceHeight(15),
                divider(),
                spaceHeight(2),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            height: 180,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(
                                ASSETS.WITHDRAWLCONTAINER,
                              ),
                              fit: BoxFit.fitWidth,
                            )),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Center(
                              child: GridView.count(
                                crossAxisCount: 2,
                                childAspectRatio: 4,
                                mainAxisSpacing: 20,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                children: List.generate(
                                  // Generate list of items
                                  4,
                                  (index) => withdrawlWidget(),
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 280,
                  width: width(context),
                  child: VimeoPlayer(),
                ),
                shadeMaskText(GAMES),
                spaceHeight(15),
                divider(),
                spaceHeight(20),
                Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 5,
                            decoration: BoxDecoration(
                                color: commonYellow,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          spaceWidth(15),
                          Text(
                            MOST_POPULAR,
                            style: TextStyle(
                                color: white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          controller.showMore = !controller.showMore;
                          controller.update();
                        },
                        child: Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                              color: commonYellow,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              !controller.showMore ? SHOW_MORE : SHOW_LESS,
                              style: TextStyle(
                                  color: white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                spaceHeight(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                    mainAxisSpacing: 20,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: List.generate(
                      // Generate list of items
                      controller.showMore ? 6 : 4,
                      (index) {
                        int angle = index * 90;
                        if (index == 3) {
                          angle = 180;
                        }
                        if (index == 2) {
                          angle = 270;
                        }
                        return Container(
                          alignment: index % 2 == 0
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          child: Stack(
                            children: [
                              Container(
                                height: 160,
                                width: 160,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                        image: AssetImage(
                                          popularList[index],
                                        ),
                                        fit: BoxFit.fill)),
                              ),
                              Container(
                                height: 160,
                                width: 160,
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 25,
                                        color: Color(0xff5a0069),
                                        padding:
                                            EdgeInsets.symmetric(vertical: 2),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            fontWhite(text: "Min.", size: 11),
                                            spaceWidth(2),
                                            Text(
                                              "₹",
                                              style: TextStyle(
                                                  color: Color(0xfff4ad09),
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            fontWhite(text: "10", size: 11),
                                            Container(
                                                child: VerticalDivider(
                                              color: commonYellow,
                                              thickness: 2,
                                            )),
                                            fontWhite(text: "Max.", size: 11),
                                            spaceWidth(2),
                                            Text(
                                              "₹",
                                              style: TextStyle(
                                                  color: commonYellow,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            fontWhite(text: "100k", size: 11),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Transform.rotate(
                                angle: angle * pi / 180,
                                child: Stack(
                                  children: [
                                    Image.asset(ASSETS.POPULAR_IMAGE_CORNER),
                                    Container(
                                      height: 160,
                                      width: 160,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: Color(0xFFF4AD09)),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                spaceHeight(20),
              ],
            );
          },
        ));
  }
}
