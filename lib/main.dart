import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kheloo/screens/homeScreen.dart';
import 'package:responsive_framework/responsive_framework.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(LayoutBuilder(
    builder: (context, constraints) {
      return OrientationBuilder(
        builder: (context, orientation) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "KHELOO",
            useInheritedMediaQuery: true,
            defaultTransition: Transition.rightToLeft,
            builder:  (context, child) => ResponsiveBreakpoints.builder(
              child: child!,
              breakpoints: [
                const Breakpoint(start: 0, end: 450, name: MOBILE),
                const Breakpoint(start: 451, end: 800, name: TABLET),
                const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
              ],
            ),
            home: HomeScreen(),
          );
        },
      );
    },
  ));
}