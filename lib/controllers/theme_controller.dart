import 'package:get/get.dart';

class ThemeController extends GetxController{
   var isDarkTheme = true.obs;

  void changeTheme() {
    isDarkTheme.value = !isDarkTheme.value;
    update();
  }
}