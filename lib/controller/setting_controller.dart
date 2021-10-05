import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingController extends GetxController {
  var isDarkTheme = false.obs;
  var isIncludeAdultContent = false.obs;
  var box = GetStorage();

  void changeTheme({required value}) {
    box.write('isDark', value);
    isDarkTheme.value = value;

    isDarkTheme.value == true
        ? Get.changeThemeMode(ThemeMode.dark)
        : Get.changeThemeMode(ThemeMode.light);
  }

  void changeContent({required value}) {
    box.write('isAdultContent', value);
    isIncludeAdultContent.value = value;
  }

  getTheme() {
    if (isDarkTheme.value) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }

  bool getAdultContent(){
    return isIncludeAdultContent.value;
  }

  @override
  void onInit() async {
    super.onInit();
    isDarkTheme(box.read('isDark') ?? false);
    isIncludeAdultContent(box.read('isAdultContent') ?? false);
  }
}
