import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/app_theme.dart';
import 'package:movie/controller/setting_controller.dart';
import 'package:movie/routes.dart';
import 'package:movie/screens/home.dart';
import 'package:get_storage/get_storage.dart';

void main()async{
  await GetStorage.init();
  runApp(MovieScout());
}

class MovieScout extends StatelessWidget {
  final SettingController settingController = Get.put(SettingController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages : routes,
      defaultTransition: Transition.native,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: settingController.getTheme(),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
