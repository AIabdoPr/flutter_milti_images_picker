import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upload_multi_image/controller.dart';
import 'package:upload_multi_image/home.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return HomePage(controller: controller);
        },
      ),
    );
  }
}
