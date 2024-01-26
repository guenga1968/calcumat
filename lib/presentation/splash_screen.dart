import 'package:calcumat/presentation/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => MainScreen(),
      ));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              // Icon(Icons.edit, size: 80, color: Colors.white,),
              Container(
                width: 300,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/sketch.png'), fit: BoxFit.fill),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            const  AutoSizeText(
              'Calculadora de Materiales',
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 24),
              maxFontSize: 24,
              maxLines: 1,
             ),
              
            ]),
          ),
        ),
      ),
    );
  }
}
