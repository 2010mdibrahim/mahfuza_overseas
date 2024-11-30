import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_device_name/flutter_device_name.dart';
import 'package:get/get.dart';

import '../../../../core/di/app_component.dart';
import '../../../../core/source/dio_client.dart';
import '../../data/model/candidate_service_info_model.dart';
import '../../domain/repository/candidate_service_info_repository.dart';
import '../../domain/usecase/candidate_service_info_pass_usecase.dart';

class CandidateServiceInfoController extends GetxController {
  var candidateServiceModel = CandidateServiceInfoModel().obs;

  var currentStep = 0.obs;
  var loading = false.obs;
  @override
  void onInit() {
    passportProcessStepFunction();
    super.onInit();
  }

  void passportProcessStepFunction() async {
    loading.value = true;
    update();
    try {
      CandidateServiceInfoPassUseCase candidateServiceInfoPassUseCase =
      CandidateServiceInfoPassUseCase(locator<CandidateServiceInfoRepository>());
      var response = await candidateServiceInfoPassUseCase();
      candidateServiceModel.value = response!.data!;
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
