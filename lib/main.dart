import 'package:calcumat/controllers/theme_controller.dart';
import 'package:calcumat/routes/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MainApp());
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
        init: ThemeController(),
        builder: (controller) => GetMaterialApp(
              scrollBehavior: MyCustomScrollBehavior(),
              initialRoute: '/',
              getPages: [
                GetPage(
                    name: '/',
                    page: () => const SplashScreen(),
                    transition: Transition.fadeIn,
                    transitionDuration: const Duration(milliseconds: 500)),
                GetPage(
                    name: '/home',
                    page: () => MainScreen(),
                    transition: Transition.fadeIn,
                    transitionDuration: const Duration(milliseconds: 500)),
                GetPage(
                    name: '/muro-select',
                    page: () => MuroSelect(),
                    transition: Transition.fadeIn,
                    transitionDuration: const Duration(milliseconds: 500)),
                GetPage(
                    name: '/muro-calculo',
                    page: () => MuroCalculo(),
                    transition: Transition.fadeIn,
                    transitionDuration: const Duration(milliseconds: 500)),
                GetPage(
                    name: '/muro-size',
                    page: () => MuroSize(),
                    transition: Transition.fadeIn,
                    transitionDuration: const Duration(milliseconds: 500)),
               
                GetPage(
                    name: '/resultadoCim',
                    page: () => Resultados(),
                    transition: Transition.fadeIn,
                    transitionDuration: const Duration(milliseconds: 500)),
                GetPage(
                    name: '/revoque',
                    page: () => Revoque(),
                    transition: Transition.fadeIn,
                    transitionDuration: const Duration(milliseconds: 500)),
                GetPage(
                    name: '/cimientos',
                    page: () => const Cimientos(),
                    transition: Transition.fadeIn,
                    transitionDuration: const Duration(milliseconds: 500)),
                GetPage(
                    name: '/cimientos-calc',
                    page: () => CimientosCalculo(),
                    transition: Transition.fadeIn,
                    transitionDuration: const Duration(milliseconds: 500)),
                GetPage(
                    name: '/pv',
                    page: () => DescontarAberturas(),
                    transition: Transition.fadeIn,
                    transitionDuration: const Duration(milliseconds: 500)),
                GetPage(
                    name: '/encadenados',
                    page: () => EncadenadosCalculo(),
                    transition: Transition.fadeIn,
                    transitionDuration: const Duration(milliseconds: 500)),
                GetPage(
                    name: '/pedido',
                    page: () => const Pedido(),
                    transition: Transition.fadeIn,
                    transitionDuration: const Duration(milliseconds: 500)),
              ],
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                useMaterial3: true,
                colorSchemeSeed: Colors.blue,
                brightness: Brightness.light,
              ),
              darkTheme: ThemeData(
                useMaterial3: true,
                colorSchemeSeed: Colors.blue,
                brightness: Brightness.dark,
              ),
              themeMode: controller.isDarkTheme.value
                  ? ThemeMode.dark
                  : ThemeMode.light,
            ));
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
