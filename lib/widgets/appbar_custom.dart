import 'package:auto_size_text/auto_size_text.dart';
import 'package:calcumat/controllers/controller.dart';
import 'package:calcumat/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  AppBarCustom({this.arguments, this.route, this.title, super.key});
  final String? title;
  final String? route;
  final Map<String, dynamic>? arguments;
  final c = Get.find<Controller>();
  final t = Get.find<ThemeController>();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    final Widget leading = route != null
        ? IconButton(
            onPressed: () {
              Get.toNamed(route!, arguments: arguments ?? {});
            
            },
            icon: const Icon(Icons.arrow_back_ios))
        : const SizedBox.shrink();
    return AppBar(
      leading: leading,
      centerTitle: true,
      title: AutoSizeText(title ?? '',maxFontSize: 15, maxLines: 1, minFontSize: 7,),
      actions: [
       
        Obx(() =>
          c.pedidos.value == true ? IconButton(
            onPressed: (){
            Get.toNamed('/pedido');
          }, icon: const Icon(Icons.create_new_folder_rounded))
          : const SizedBox.shrink()
          ), 
           
           Obx(() => IconButton(
                  icon: t.isDarkTheme.value ? const Icon(Icons.wb_sunny) : const Icon(Icons.nights_stay),
                  onPressed: () {
                    t.changeTheme();
                  },
                )),
      ],
    );
  }
}
