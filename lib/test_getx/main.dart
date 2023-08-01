import 'package:flutter/material.dart';
import 'package:flutter_starter/test_getx/controller/GetXControllerWorkersExample.dart';
import 'package:flutter_starter/test_getx/news/view/MovieListView.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return GetMaterialApp(
    //   title: "GetX",
    //   initialRoute: "/",
    //   defaultTransition: Transition.zoom,
    //   getPages: [
    //     GetPage(name: "/", page: () => MyApp()),
    //     GetPage(name: "/home", page: () => HomePage()),
    //     GetPage(name: "/my", page: () => My(), transition: Transition.rightToLeft)
    //   ],
    //   home: NavigationForNamedExample(),
    // );
    return GetMaterialApp(
      title: "GetX",
      home: MovieListView(),
    );
  }
}

