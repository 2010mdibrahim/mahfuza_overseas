// import 'dart:io';
//
// import 'package:mahfuza_overseas/src/core/source/pref_manager.dart';
//
// import '../../../main.dart';
// import '../../features/login_screen/data/model/login_model.dart';
// import '../utilities/constants.dart';
//
// class SessionManager {
//   Future<bool> createSession(LoginModel? loginModelData, { String? phoneNumber,  String? password}) async {
//     try {
//       if(loginModelData?.type == "employee"){
//         box.write("fullName", loginModelData?.candidate?.fullName);
//         box.write("password", password);
//         box.write("phoneNumber", phoneNumber);
//         box.write("photo", loginModelData?.candidate?.avaterPhoto);
//       } else if (loginModelData?.type == "agent"){
//         box.write("fullName", loginModelData?.candidate?.agentName);
//         box.write("password", password);
//         box.write("phoneNumber", phoneNumber);
//         print("the phone number pass $phoneNumber ${box.read("candidateId")} ${box.read("phoneNumber")}");
//         box.write("photo", loginModelData?.candidate?.avaterPhoto);
//       }else{
//         box.write("fullName", loginModelData?.candidate?.fullName);
//         box.write("password", password);
//         box.write("phoneNumber", phoneNumber);
//         box.write("photo", loginModelData?.candidate?.candidatePhoto);
//       }
//       print(loginModelData?.candidate?.id);
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }
//
//
// //   final PrefManager _prefManager;
// //
// //   SessionManager(this._prefManager);
// //
// //   String? get getFullName =>
// //       _prefManager.getStringValue("fullName");
// //   set setFullName(String? value) => _prefManager.saveString(
// //       "fullName", value ?? "");
// //
// //   String? get getUserPID =>
// //       _prefManager.getStringValue("userPID");
// //   set setUserPID(String? value) => _prefManager.saveString(
// //       "userPID", value ?? "");
// //
// //   String? get getPassword =>
// //       _prefManager.getStringValue("password");
// //   set setPassword(String? value) => _prefManager.saveString(
// //       "password", value ?? "");
// //
// //   String? get getPhoneNumber =>
// //       _prefManager.getStringValue("phoneNumber");
// //   set setPhoneNumber(String? value) => _prefManager.saveString(
// //       "phoneNumber", value ?? "");
// //
// //
// //   String? get getPhoto =>
// //       _prefManager.getStringValue("photo");
// //   set setPhoto(String? value) => _prefManager.saveString(
// //       "photo", value ?? "");
// //
// //
// // set setBaseUrl(String? value)=> _prefManager.saveString("baseUrl", value);
// //   String? get getBaseUrl =>
// //       _prefManager.getStringValue("baseUrl");
// //
// //   set setCandidateId(String? value)=> _prefManager.saveString("candidateId", value);
// //   String? get getCandidateId =>
// //       _prefManager.getStringValue("candidateId");
// //
// //   String? get getDeviceId =>
// //       _prefManager.getStringValue("deviceId");
// //   set setDeviceId(String? value) => _prefManager.saveString(
// //       "deviceId", value ?? "");
//
//   Future<bool> logout() async {
//     bool response = false;
//     // await box.erase().whenComplete(() {
//     //   response = true;
//     // });
//     return response;
//   }
// }
