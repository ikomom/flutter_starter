import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(() => const HomePage());
              },
              child: const Text('到下一个Home'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('返回上一页'),
            ),
          ],
        ),
      ),
    );
  }
}
