import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_device_name/flutter_device_name.dart';
import 'package:get/get.dart';
import 'package:mahfuza_overseas/main.dart';
import '../../core/di/app_component.dart';
import '../../core/routes/route_name.dart';
import '../../core/routes/router.dart';
import '../../core/source/dio_client.dart';
import '../login_screen/ui/controller/login_controller.dart';

class SplashScreenController extends GetxController{
var loginController = locator<LoginController>();
  @override
  void onInit() {
    checkApplicationInformation();
    super.onInit();
  }

void checkApplicationInformation()async{

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  final plugin = DeviceName();
  final deviceName = await plugin.getName();
print("value are ${box.read("phoneNumber")} ${box.read("password")}");

  // session.setDeviceId = androidInfo.id;
  Future.delayed(const Duration(seconds: 3), () async {
  if((box.read("phoneNumber") != null) && (box.read("password") != null) ){
    loginController.submitLoginData(navigatorKey.currentContext!);
  }else{
      RouteGenerator.pushNamedAndRemoveAll(
          navigatorKey.currentContext!, Routes.loginScreen);
  }
  });
}
}