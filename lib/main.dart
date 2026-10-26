import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortlingo/src/custom/custom_theme_data.dart';
import 'package:shortlingo/src/routes/app_pages.dart';
import 'package:shortlingo/src/routes/route_name.dart';

void main() {
  runApp(const ShortLingoApp());
}

class ShortLingoApp extends StatelessWidget {
  const ShortLingoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ShortLingo',
      debugShowCheckedModeBanner: false,
      theme: CustomThemeData.getAppTheme(),
      initialRoute: RouteName.login,
      getPages: AppPages.pages,
    );
  }
}
