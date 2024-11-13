import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_device_name/flutter_device_name.dart';
import 'package:get/get.dart';

import '../../../../core/di/app_component.dart';
import '../../../../core/source/dio_client.dart';
import '../../../login_screen/data/model/login_model.dart';
import '../../data/model/passport_process_model.dart';
import '../../domain/repository/passport_process_repository.dart';
import '../../domain/usecase/passport_process_pass_usecase.dart';

class PassportProcessStepController extends GetxController {
  var passportProcessStepsList = PassportProcessStepModel().obs;
  List<Step> steps = [];
  List<ProcessList> processList = [
    // Add your process list here
  ];
  var userModel = LoginModel();
  List<ProcessRecord> recordList = [
    // Add your record list here
  ];
  var currentStep = 0.obs;
  var loading = false.obs;

  void passportProcessStepFunction({String? candidateId}) async {
    loading.value = true;
    print("Candidate ID: $candidateId");
    update();

    // Check if the user type is not "employee" or is "agent"
    if (userModel.type != "employee" || userModel.type == "agent") {
      try {
        PassportPassUseCase passportPassUseCase = PassportPassUseCase(locator<PassportRepository>());
        var response = await passportPassUseCase(candidateId: candidateId);
        // Assigning response data to passportProcessStepsList
        passportProcessStepsList.value = response!.data!;
        // Clearing the steps list to avoid duplicates on subsequent calls
        steps.clear();
        // Iterate over each process step
        for (var i in passportProcessStepsList.value.processList!) {
          // Check if processRecord is not null and not empty
          var record;
          if (passportProcessStepsList.value.processRecord != null &&
              passportProcessStepsList.value.processRecord!.isNotEmpty) {
            // Find record with matching stepId or fallback to first element
            record = passportProcessStepsList.value.processRecord!.firstWhere(
                  (r) => r.stepId == i.id,
              orElse: () => passportProcessStepsList.value.processRecord!.first,
            );
          }

          // Add a new step if it does not exist already
          if (record != null && record.stepId == i.id) {
            if (!steps.any((step) => step.id == i.id)) {
              steps.add(Step(i.id, i.processName, record));
            }
          } else {
            if (!steps.any((step) => step.id == i.id)) {
              steps.add(Step(i.id, i.processName, null));
            }
          }
        }
      } on PlatformException catch (e) {
        print("Platform Exception: ${e.message}");
      } catch (e) {
        print("Error: $e");
      } finally {
        loading.value = false;
        update();
      }
    }

    update();
  }

  increament() {

    if(passportProcessStepsList.value.processList?.length != currentStep.value + 1){
      currentStep.value++;
    }
    update();
  }

  decreament() {
    if(currentStep.value != 0){
      currentStep.value--;
    }
    update();
  }
  String addOrdinalIndicator(int day) {
    if (day >= 11 && day <= 13) {
      return '${day}th';
    }
    switch (day % 10) {
      case 1:
        return '${day}st';
      case 2:
        return '${day}nd';
      case 3:
        return '${day}rd';
      default:
        return '${day}th';
    }
  }

}
class Step {
  final String id;
  final String name;
  final ProcessRecord? details;

  Step(this.id, this.name, this.details);
}