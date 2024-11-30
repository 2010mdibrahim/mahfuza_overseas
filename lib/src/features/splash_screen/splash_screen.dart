import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahfuza_overseas/src/core/extensions/extensions.dart';
import 'package:mahfuza_overseas/src/features/splash_screen/splash_controller.dart';
import '../../core/utilities/assets_image.dart';
import '../../core/utilities/theme_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashScreenController(),
      builder: (context) {
        return Scaffold(
              body: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/background_image.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                           alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(backgroundColor: ThemeConfig.logoColor, valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),)),
                          ),
                        ),

                  ),
                  Positioned(
                    top: 220,
                    left: 0,
                    right: -30,
                    child: Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Center(child: Image.asset(AssetImagePath.mahfuzaLogo, height: 170, width: 170,)),
                  ),)
                ],
              ),
            );
      }
    );

  }
}
