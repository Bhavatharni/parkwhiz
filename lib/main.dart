import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ParkWhiz/splace_controller.dart';
import 'package:ParkWhiz/splace_screen.dart';
import 'routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SplaceController splaceController = Get.put(SplaceController());
    return GetMaterialApp(
      title: 'Car Parking',
      getPages: pages,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const Splace_Screen(),
    );
  }
}
