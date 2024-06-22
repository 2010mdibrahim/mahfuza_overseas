import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahfuza_overseas/src/core/extensions/extensions.dart';
import 'package:mahfuza_overseas/src/features/splash_screen/splash_controller.dart';
import '../../core/routes/route_name.dart';
import '../../core/routes/router.dart';
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
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Image.asset(AssetImagePath.mahfuzaLogo, height: 200, width: 200,),
                    ),
                  ),
                   Center(
                    child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(backgroundColor: ThemeConfig.logoColor, valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),)),
                  ),
                  20.ph,
                ],
              ),
            );
      }
    );

  }
}
