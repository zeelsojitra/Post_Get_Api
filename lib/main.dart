import 'package:all_api_practic/post/view/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'demo/get/mackup.dart';
import 'get/mackup/mackup_get_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Api',
      home: SignupPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
