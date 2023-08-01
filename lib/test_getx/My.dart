import 'package:flutter/material.dart';
import 'package:get/get.dart';

class My extends StatelessWidget {
  const My({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('my'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/home');
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
