import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahfuza_overseas/src/features/login_screen/data/model/login_model.dart';
import 'package:mahfuza_overseas/src/features/splash_screen/splash_controller.dart';

import '../../../../core/di/app_component.dart';
import '../../../../core/routes/route_name.dart';
import '../../../../core/routes/router.dart';
import '../../../../core/source/dio_client.dart';
import '../../../attendance/presentation/controller/attendance_controller.dart';
import '../../../dashboard_screen/dashboard_controller.dart';
import '../../../widgets/custom_toast.dart';
import '../../domain/repository/login_repository.dart';
import '../../domain/usecase/login_with_id_pass_usecase.dart';

class LoginController extends GetxController{
  var emailTextFieldController = TextEditingController(text: "00001");
  var passwordTextFieldController = TextEditingController(text: "300100111");
  var passwordVisibility = true.obs;
  var errorMessage = ''.obs;
  var isLoading = false.obs;
  var splashController = locator<DashboardController>();
  var employeeAttendanceController = locator<EmployeeAttendanceController>();
  passwordVisibilityFun(){
    passwordVisibility.value = !passwordVisibility.value;
    print(passwordVisibility.value);
    update();
  }
  errorMessageHandling(String? s){
    if(passwordTextFieldController.text!.isNotEmpty && passwordTextFieldController.text.length < 8){
      errorMessage.value = 'Password must be in 8 character';
    }else{
      errorMessage.value = '';
    }
    update();
  }

  submitLoginData(BuildContext context) async {
    isLoading.value = true;
    update();
    // try {
      LoginWithIdPassUseCase loginUseCase =
      LoginWithIdPassUseCase(locator<SignInRepository>());
      var response = await loginUseCase(userName: emailTextFieldController.text, password: passwordTextFieldController.text);
    print("this is data of login ${response?.data?.type}");
      if (response?.data != null && response?.data?.code == "200") {
        print("this is data of login ${response?.data?.candidate?.fName}");
        if (!context.mounted) return;
        splashController.userInformation.value = response?.data ?? LoginModel();
        session.createSession(response?.data, phoneNumber: emailTextFieldController.text, password: passwordTextFieldController.text);
        session.setBaseUrl = response?.data?.baseUrl;
        session.setCandidateId = response?.data?.candidate?.id;
        employeeAttendanceController.employeeAttendanceFunction();
        RouteGenerator.pushNamedAndRemoveAll(context, Routes.dashboard);
        if (!context.mounted) return;
        successToast(context: context,  msg: response?.data?.message ?? '');
      } else {
        if (!context.mounted) return;
        if(response?.data?.status == null){
        errorToast(context: context,  msg: "Invalid login credential!");
        }
      }
    // } catch (e) {
    //   print(e.toString() ?? '');
    // }
    // finally {
      isLoading.value = false;
    // }
    update();
  }
}