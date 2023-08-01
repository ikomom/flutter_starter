import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationForNamedExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX NavigationForNamed"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  Get.toNamed("/my");
                },
                child: const Text("my"))
          ],
        ),
      ),
    );
  }
}