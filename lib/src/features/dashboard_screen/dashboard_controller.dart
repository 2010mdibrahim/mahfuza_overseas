import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../core/contacts/data/source/contact_service.dart';
import '../../core/di/app_component.dart';
import '../login_screen/data/model/login_model.dart';
import '../login_screen/domain/repository/login_repository.dart';
import '../login_screen/domain/usecase/login_with_id_pass_usecase.dart';

class DashboardController extends GetxController{
  var userInformation = Candidate().obs;
  var loading = false.obs;
  @override
  void onInit() {
    userInformationFu();
    super.onInit();
  }
void userInformationFu() async{
  loading.value = true;
  update();
  try {
  if((session.getPhoneNumber?.isNotEmpty ?? false) && (session.getPassword?.isNotEmpty ?? false))  {
    LoginWithIdPassUseCase loginUseCase = LoginWithIdPassUseCase(locator<SignInRepository>());
    var response = await loginUseCase(userName: session.getPhoneNumber ?? '', password: session.getPassword ?? '');
    userInformation.value = response!.data!.candidate!;
    session.createSession(response?.data?.candidate);
    session.setBaseUrl = response.data?.baseUrl;
    session.setCandidateId = response.data?.candidate?.id;
    print("this is data of login ${response?.data?.candidate?.fullName}");
    print("Api Response hudai $response");
  }
  } on PlatformException catch (e) {
    String platformVersion = '${e.message}';
    print(platformVersion);
  }finally{
    loading.value = false;
  }
}
}