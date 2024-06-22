import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_device_name/flutter_device_name.dart';
import 'package:get/get.dart';

import '../../../../core/contacts/data/model/contact_model.dart';
import '../../../../core/di/app_component.dart';
import '../../../../core/source/dio_client.dart';
import '../../data/model/notification_model.dart';
import '../../domain/repository/notification_repository.dart';
import '../../domain/usecase/notification_pass_usecase.dart';

class NotificationController extends GetxController {
  var notificationModel = NotificationModel().obs;
  var notificationUpdateModel = ContactModel().obs;

  var currentStep = 0.obs;
  var loading = false.obs;
  @override
  void onInit() {
    notificationFunction();
    super.onInit();
  }

  void notificationFunction() async {
    loading.value = true;
    update();
    try {
      NotificationPassUseCase promotionPassUseCase =
      NotificationPassUseCase(locator<NotificationRepository>());
      var response = await promotionPassUseCase();
      notificationModel.value = response!.data!;
    } on PlatformException catch (e) {
      String platformVersion = '${e.message}';
      print(platformVersion);
    } finally {
      loading.value = false;
      update();
    }
    update();
  }

  void notificationUpdateFunction({String? updateNotificationId}) async {

    try {
      NotificationUpdatePassUseCase notificationUpdatePassUseCase =
      NotificationUpdatePassUseCase(locator<NotificationRepository>());
      var response = await notificationUpdatePassUseCase(updateNotificationId: updateNotificationId);
      notificationUpdateModel.value = response!.data!;
    } on PlatformException catch (e) {
      String platformVersion = '${e.message}';
      print(platformVersion);
    }
    update();
  }
}
