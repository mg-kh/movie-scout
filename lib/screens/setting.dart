import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/constants.dart';
import 'package:movie/controller/setting_controller.dart';

class Setting extends StatelessWidget {
  final SettingController settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: Text('Setting'),
        backgroundColor: kSecondaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(kHorizontalPaddingValue),
        child: Column(
          children: [
            //! change theme
            Obx(()=>SwitchListTile(
              value: settingController.isDarkTheme.value,
              title: Text('Enable dark theme', style: TextStyle(
                  color: context.theme.primaryColor
              ),),
              activeColor: kSecondaryColor,
              onChanged: (value){
                settingController.changeTheme(value: value);
              },
            )),

            //! change content
            Obx(() => SwitchListTile(
              value: settingController.isIncludeAdultContent.value,
              title: Text('Include adult content',style: TextStyle(
                  color: context.theme.primaryColor
              ),),
              activeColor: kSecondaryColor,
              onChanged: (value){
                settingController.changeContent(value: value);
              },
            )),
          ],
        ),
      ),
    );
  }
}
