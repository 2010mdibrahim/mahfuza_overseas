import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_device_name/flutter_device_name.dart';
import 'package:get/get.dart';

import '../../../../core/di/app_component.dart';
import '../../../../core/source/dio_client.dart';
import '../../data/model/promotion_model.dart';
import '../../domain/repository/promotion_repository.dart';
import '../../domain/usecase/promotion_pass_usecase.dart';

class PromotionController extends GetxController {
  var promotionalModel = PromotionalModel().obs;

  var currentStep = 0.obs;
  var loading = false.obs;
  @override
  void onInit() {
    promotionFunction();
    super.onInit();
  }

  void promotionFunction() async {
    loading.value = true;
    update();
    try {
      NotificationPassUseCase promotionPassUseCase =
      NotificationPassUseCase(locator<PromotionRepository>());
      var response = await promotionPassUseCase();
      promotionalModel.value = response!.data!;
    } on PlatformException catch (e) {
      String platformVersion = '${e.message}';
      print(platformVersion);
    } finally {
      loading.value = false;
      update();
    }
    update();
  }
}
