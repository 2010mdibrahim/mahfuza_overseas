import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mahfuza_overseas/src/features/login_screen/data/model/agent_model.dart';
import 'package:mahfuza_overseas/src/features/login_screen/data/model/login_model.dart';
import '../../../../../main.dart';
import '../../../../core/di/app_component.dart';
import '../../../../core/routes/route_name.dart';
import '../../../../core/routes/router.dart';
import '../../../../core/source/dio_client.dart';
import '../../../dashboard_screen/dashboard_controller.dart';
import '../../../widgets/custom_toast.dart';
import '../../domain/repository/login_repository.dart';
import '../../domain/usecase/login_with_id_pass_usecase.dart';

class LoginController extends GetxController {
  var emailTextFieldController = TextEditingController();
  var passwordTextFieldController = TextEditingController();
  var userInformation = LoginModel().obs;
  var passwordVisibility = true.obs;
  var errorMessage = ''.obs;
  var isLoading = false.obs;
  var userInfoLoading = false.obs;
  var isBalanceLoading = false.obs;
  var balanceModel = AgentBalanceModel().obs;
  @override
  void onInit() {

    super.onInit();
  }
  passwordVisibilityFun() {
    passwordVisibility.value = !passwordVisibility.value;
    if (kDebugMode) {
      print(passwordVisibility.value);
    }
    update();
  }

  errorMessageHandling(String? s) {
    if (passwordTextFieldController.text.isNotEmpty &&
        passwordTextFieldController.text.length < 8) {
      errorMessage.value = 'Password must be in 8 character';
    } else {
      errorMessage.value = '';
    }
    update();
  }

  submitLoginData(BuildContext context) async {
    isLoading.value = true;
    update();
    try {
      LoginWithIdPassUseCase loginUseCase =
          LoginWithIdPassUseCase(locator<SignInRepository>());
      var response = await loginUseCase(
        userName: box.read("phoneNumber") ?? emailTextFieldController.text,
        password: box.read("password") ?? passwordTextFieldController.text,
      );
      print("this is data of login ${response?.data?.type}");
      if (response?.data != null && response?.data?.code == "200") {
        print("this is data of login ${response?.data?.type}");
        if (!context.mounted) return;
        userInformation.value = response?.data ?? LoginModel();
        // session.createSession(response?.data,
        //     phoneNumber: emailTextFieldController.text,
        //     password: passwordTextFieldController.text);
        print("type of candidate ${response?.data?.type}");
        box.write("type", response?.data?.type);
        box.write("baseUrl", response?.data?.baseUrl ?? '');

        if(response?.data?.type == "agent"){
          print("is in agent ${response?.data?.candidate?.id.toString()}");
          box.write("candidateId", response?.data?.candidate?.id);
          print("is in agent ${box.read("candidateId")}");
          box.write("showTransaction", response?.data?.candidate?.showTransaction.toString());
          box.write("fullName", response?.data?.candidate?.agentName);
          box.write("password", passwordTextFieldController.text);
          box.write("phoneNumber", emailTextFieldController.text);
          box.write("photo", response?.data?.candidate?.agentPhoto);
          agentBalanceFun(context);
        }else if(response?.data?.type == "employee"){
          box.write("candidateId", response?.data?.candidate?.employeeId);
          box.write("fullName", response?.data?.candidate?.fullName);
          box.write("password", passwordTextFieldController.text);
          box.write("phoneNumber", emailTextFieldController.text);
          box.write("photo", response?.data?.candidate?.avaterPhoto);
        }
        else{
          box.write("fullName", response?.data?.candidate?.fullName);
          box.write("password", passwordTextFieldController.text);
          box.write("phoneNumber", emailTextFieldController.text);
          box.write("photo", response?.data?.candidate?.candidatePhoto);
        }
        // employeeAttendanceController.employeeAttendanceFunction();
        RouteGenerator.pushNamedAndRemoveAll(context, Routes.dashboard);
        userInformationFu();
        if (!context.mounted) return;
        if((box.read("phoneNumber") == null) && (box.read("password") == null) ){
        successToast(context: context, msg: response?.data?.message ?? '');
        }
      } else {
        if (!context.mounted) return;
        if (response?.data?.status == null) {
          errorToast(context: context, msg: "Invalid login credential!");
        }
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString() ?? '');
    } finally {
      isLoading.value = false;
    }
    update();
  }

  agentBalanceFun(BuildContext context) async {
    isBalanceLoading.value = true;
    update();
    try {
      AgentBalanceModelPassUseCase agentBalanceModelPassUseCase =
      AgentBalanceModelPassUseCase(locator<SignInRepository>());
      var response = await agentBalanceModelPassUseCase(
        id: box.read("candidateId") ?? '',
      );
      if (response?.data != null && response?.data?.code == "200") {
        balanceModel.value = response?.data ?? AgentBalanceModel();
      } else {
        if (!context.mounted) return;
        if (response?.data?.status == null) {
          errorToast(context: context, msg: "Invalid login credential!");
        }
      }
    } catch (e) {
      isBalanceLoading.value = false;
      print(e.toString() ?? '');
    } finally {
      isBalanceLoading.value = false;
    }
    update();
  }
  void userInformationFu() async {
    userInfoLoading.value = true;
    update();
    try {
      if ((box.read("phoneNumber").toString().isNotEmpty) &&
          (box.read("password").toString().isNotEmpty)) {
        LoginWithIdPassUseCase loginUseCase =
        LoginWithIdPassUseCase(locator<SignInRepository>());
        var response = await loginUseCase(
            userName: box.read("phoneNumber").toString(),
            password: box.read("password").toString(),
        );

        userInformation.value = response?.data ?? LoginModel();
        box.write("baseUrl", response?.data?.baseUrl ?? '');
        if(response?.data?.type == "agent"){
          print("is in agent");
          box.write("candidateId", response?.data?.candidate?.id.toString());
          box.write("showTransaction", response?.data?.candidate?.showTransaction.toString());
        }
        else{
          box.write("candidateId", response?.data?.candidate?.employeeId);
        }

      }
    } on PlatformException catch (e) {
      String platformVersion = '${e.message}';
      print(platformVersion);
    } finally {
      userInfoLoading.value = false;
    }
  }
}
