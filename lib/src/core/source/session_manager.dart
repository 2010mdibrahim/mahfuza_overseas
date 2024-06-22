import 'dart:io';

import 'package:mahfuza_overseas/src/core/source/pref_manager.dart';

import '../../features/login_screen/data/model/login_model.dart';
import '../utilities/constants.dart';

class SessionManager {
  Future<bool> createSession(Candidate? loginModelData) async {
    try {
      setFullName = loginModelData?.fullName;
      setPassword = loginModelData?.password;
      setPhoneNumber = loginModelData?.phoneNumber;
      setPhoto = loginModelData?.candidatePhoto;
      print(loginModelData?.id);
      return true;
    } catch (e) {
      return false;
    }
  }


  final PrefManager _prefManager;

  SessionManager(this._prefManager);

  String? get getFullName =>
      _prefManager.getStringValue("fullName");
  set setFullName(String? value) => _prefManager.saveString(
      "fullName", value ?? "");

  String? get getUserPID =>
      _prefManager.getStringValue("userPID");
  set setUserPID(String? value) => _prefManager.saveString(
      "userPID", value ?? "");

  String? get getPassword =>
      _prefManager.getStringValue("password");
  set setPassword(String? value) => _prefManager.saveString(
      "password", value ?? "");

  String? get getPhoneNumber =>
      _prefManager.getStringValue("phoneNumber");
  set setPhoneNumber(String? value) => _prefManager.saveString(
      "phoneNumber", value ?? "");


  String? get getPhoto =>
      _prefManager.getStringValue("photo");
  set setPhoto(String? value) => _prefManager.saveString(
      "photo", value ?? "");


set setBaseUrl(String? value)=> _prefManager.saveString("baseUrl", value);
  String? get getBaseUrl =>
      _prefManager.getStringValue("baseUrl");

  set setCandidateId(String? value)=> _prefManager.saveString("candidateId", value);
  String? get getCandidateId =>
      _prefManager.getStringValue("candidateId");

  String? get getDeviceId =>
      _prefManager.getStringValue("deviceId");
  set setDeviceId(String? value) => _prefManager.saveString(
      "deviceId", value ?? "");

  Future<bool> logout() async {
    bool response = false;
    await _prefManager.logOut().whenComplete(() {
      response = true;
    });
    return response;
  }
}
