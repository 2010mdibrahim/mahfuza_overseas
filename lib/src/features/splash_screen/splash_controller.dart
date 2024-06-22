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

import '../login_screen/data/model/login_model.dart';
import '../login_screen/domain/repository/login_repository.dart';
import '../login_screen/domain/usecase/login_with_id_pass_usecase.dart';

class SplashScreenController extends GetxController{

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

  print('Device name: ${deviceName ?? 'Unknown'}');
  print('Running on model ${androidInfo.model}');
  print('Running on id ${androidInfo.id}');
  session.setDeviceId = androidInfo.id;
  Future.delayed(const Duration(seconds: 3), () async {
  if((session.getPhoneNumber?.isNotEmpty ?? false) && (session.getPassword?.isNotEmpty ?? false)){

    RouteGenerator.pushNamedAndRemoveAll(
        navigatorKey.currentContext!, Routes.dashboard);
  }else{
      RouteGenerator.pushNamedAndRemoveAll(
          navigatorKey.currentContext!, Routes.loginScreen);
  }
  });



}

}