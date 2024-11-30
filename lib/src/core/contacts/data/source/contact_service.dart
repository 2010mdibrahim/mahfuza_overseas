
import 'dart:convert';
import '../../../../../main.dart';
import '../../../../core/di/app_component.dart';
import '../../../../core/network/configuration.dart';
import '../../../../core/source/dio_client.dart';
import '../../../../core/source/model/api_response.dart';
import '../../../../core/source/session_manager.dart';
import '../../../../core/utilities/constants.dart';
import '../../ui/contact_controller/contact_controller.dart';
import '../model/contact_model.dart';

import 'package:dio/dio.dart' as dio;

class ContactService {
  final DioClient _dioClient = locator<DioClient>();

  Future<Response<ContactModel?>?> contactPass({required List<dynamic> contactList}) async {
    Response<ContactModel>? apiResponse;
    print(contactList);
    dio.FormData formData = dio.FormData.fromMap({
      "candidate_id": box.read("candidateId").toString(),
      "access_token": "7a6b8847409097e23a493bd1affdd9e30b52dfe9abc9fd781086dd52c088d4d3",
      "api_type": "candidate_contact_collection",
      "data_array": contactList
    });
   await _dioClient.post(
      path: '',
      request: formData,
      responseCallback: (response, message) {
var contactModel = ContactModel.fromJson(response);
        // Create a Response object with the parsed data
        apiResponse = apiResponse = Response.success(contactModel);
        logger.i("Login successful:");
      },
      failureCallback: (message, status) {
        apiResponse = Response.error(message, status);
      },
    );

    logger.e("api response ${apiResponse?.data}");
    return apiResponse;
  }


}
