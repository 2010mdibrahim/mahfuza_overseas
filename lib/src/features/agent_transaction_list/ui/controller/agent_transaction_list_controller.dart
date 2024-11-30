import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_device_name/flutter_device_name.dart';
import 'package:get/get.dart';

import '../../../../../main.dart';
import '../../../../core/contacts/data/model/contact_model.dart';
import '../../../../core/di/app_component.dart';
import '../../../../core/source/dio_client.dart';
import '../../data/model/agent_transaction_list_model.dart';
import '../../domain/repository/agent_transaction_list_repository.dart';
import '../../domain/usecase/agent_transaction_list_pass_usecase.dart';

class AgentTransactionListModelController extends GetxController {

  var agentTransactionListModel = AgentTransactionListModel().obs;

  var currentStep = 0.obs;
  var loading = false.obs;
  @override
  void onInit() {
    candidateListFunction();
    super.onInit();
  }

  void candidateListFunction() async {
    loading.value = true;
    update();

    try {
      // Initialize the use case
      AgentTransactionListModelPassUseCase agentTransactionListModelPassUseCase =
      AgentTransactionListModelPassUseCase(locator<AgentTransactionListModelRepository>());

      // Fetch the response
      var response = await agentTransactionListModelPassUseCase(id: box.read("candidateId").toString());

      // Ensure the response is not null and has data
      if (response?.data?.data != null) {
        // Loop through the candidate data and assign to respective models
        agentTransactionListModel.value = response?.data ?? AgentTransactionListModel();
      } else {
        print("No candidate data found in the response.");
      }
    } on PlatformException catch (e) {
      // Handle platform-specific exceptions
      loading.value = false;
      String platformVersion = '${e.message}';
      print("PlatformException: $platformVersion");
    } catch (e) {
      // Catch any other exceptions that might occur
      loading.value = false;
      print("Error: $e");
    } finally {
      // Stop loading and update state
      loading.value = false;
      update();
    }
  }





}
