import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mahfuza_overseas/src/features/attendance/data/model/employee_attendance_model.dart';
import 'package:mahfuza_overseas/src/features/attendance/presentation/controller/attendance_controller.dart';

import '../../core/contacts/data/source/contact_service.dart';
import '../../core/di/app_component.dart';
import '../login_screen/data/model/login_model.dart';
import '../login_screen/domain/repository/login_repository.dart';
import '../login_screen/domain/usecase/login_with_id_pass_usecase.dart';

class DashboardController extends GetxController {
  var userInformation = LoginModel().obs;
  var loading = false.obs;
  // var employeeAttendanceController = locator<EmployeeAttendanceController>();
  @override
  void onInit() {
    userInformationFu();
    super.onInit();
  }

  void userInformationFu() async {
    loading.value = true;
    update();
    try {
      if ((session.getPhoneNumber?.isNotEmpty ?? false) &&
          (session.getPassword?.isNotEmpty ?? false)) {
        LoginWithIdPassUseCase loginUseCase =
            LoginWithIdPassUseCase(locator<SignInRepository>());
        var response = await loginUseCase(
            userName: session.getPhoneNumber ?? '',
            password: session.getPassword ?? '');

        userInformation.value = response?.data ?? LoginModel();

        session.createSession(response?.data);
        session.setBaseUrl = response?.data?.baseUrl;
        session.setCandidateId = response?.data?.candidate?.employeeId;
        // employeeAttendanceController.employeeAttendanceFunction();
      }
    } on PlatformException catch (e) {
      String platformVersion = '${e.message}';
      print(platformVersion);
    } finally {
      loading.value = false;
    }
  }
}
