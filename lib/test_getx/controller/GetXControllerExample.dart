import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'MyController.dart';

class GetXControllerExample extends StatelessWidget {

  // 第一种
  MyController myController = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX Obx---GetXController"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 第一种
            Obx(() => Text(
              "我的名字是 ${myController.teacher.name}",
              style: TextStyle(color: Colors.red, fontSize: 30),
            )),
            // 第二种
            GetX<MyController>(
              init: MyController(),
              builder: (controller) {
                return Text(
                  "我的名字是 ${controller.teacher.name}",
                  style: TextStyle(color: Colors.blue, fontSize: 30),
                );
              },
            ),
            // 第三种
            GetBuilder<MyController>(
              init: myController,
              builder: (controller) {
                return Text(
                  "我的名字是 ${controller.teacher.name}",
                  style: TextStyle(color: Colors.green, fontSize: 30),
                );
              },
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  // 第一种
                  myController.convertToUpperCase();

                  // 第二种
                  // Get.find<MyController>().convertToUpperCase();

                },
                child: Text("转换为大写"))
          ],
        ),
      ),
    );
  }
}