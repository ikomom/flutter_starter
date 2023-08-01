import 'package:get/get.dart';

class Teacher {
  var name = 'teacher'.obs;

}

class MyController extends GetxController {

  // 第一种
  // var teacher = Teacher();
  //
  // void convertToUpperCase() {
  //   teacher.name.value = teacher.name.value.toUpperCase();
  // }

  // 第二种
  // var teacher =  Teacher(name: "Jimi", age: 18).obs;
  // void convertToUpperCase() {
  //   teacher.update((val) {
  //     teacher.value.name = teacher.value.name.toString().toUpperCase();
  //   });
  // }

  // 第三种
  var teacher = Teacher();

  void convertToUpperCase() {
    teacher.name.value = teacher.name.value.toUpperCase();
    update();
  }
}