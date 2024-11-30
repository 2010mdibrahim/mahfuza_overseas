import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mahfuza_overseas/src/features/attendance/data/model/employee_attendance_model.dart';
import 'package:mahfuza_overseas/src/features/attendance/presentation/controller/attendance_controller.dart';

import '../../core/contacts/data/source/contact_service.dart';
import '../../core/di/app_component.dart';
import '../login_screen/data/model/login_model.dart';
import '../login_screen/domain/repository/login_repository.dart';
import '../login_screen/domain/usecase/login_with_id_pass_usecase.dart';
import '../login_screen/ui/controller/login_controller.dart';

// class DashboardController extends GetxController {
//
//   var loading = false.obs;
//   var loginController = locator<LoginController>();
//   @override
//   void onInit() {
//     userInformationFu();
//     super.onInit();
//   }
//
//
// }
