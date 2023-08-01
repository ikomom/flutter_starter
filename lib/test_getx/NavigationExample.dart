import 'package:flutter/material.dart';
import 'package:flutter_starter/test_getx/Home.dart';
import 'package:get/get.dart';

class NavigationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX Navigation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  Get.to(
                    () => const HomePage(),
                    fullscreenDialog: true,
                    transition: Transition.upToDown,
                    duration: const Duration(seconds: 2),
                    curve: Curves.bounceInOut
                  );
                },
                child: const Text("跳转到首页"))
          ],
        ),
      ),
    );
  }
}