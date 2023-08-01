import 'package:flutter/material.dart';
import 'package:flutter_starter/test_getx/controller/WorkersController.dart';
import 'package:get/get.dart';

class GetXControllerWorkersExample extends StatelessWidget {

  WorkersController workersController = Get.put(WorkersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetXWorkersController"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => workersController.increment(),
                child: Text("增加")
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                onChanged: (val) {
                  workersController.increment();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}