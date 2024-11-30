import 'dart:convert';

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahfuza_overseas/main.dart';
import 'package:mahfuza_overseas/src/core/contacts/domain/repository/contact_repository.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart' as dio;
import 'package:permission_handler/permission_handler.dart';
import '../../../../features/candidate_service_info/data/source/candidate_service_info_service.dart';
import '../../../di/app_component.dart';
import '../../domain/usecase/contact_pass_usecase.dart';
import 'package:dio/dio.dart';
class ContactController extends GetxController{
  Iterable<Contact>? contacts = [];
  List<Map<String, dynamic>> contactsList = [];
  // @override
  // void onInit() {
  //   getContacts();
  //   super.onInit();
  // }
  @override
  void dispose() {
    getContacts();
    super.dispose();
  }
  final Dio dior = Dio();



  Future<void> getContacts() async {
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      ContactPassUseCase contactPassUseCase =
      ContactPassUseCase(locator<ContactRepository>());

      print("granted");
      // Retrieve contacts
      Iterable<Contact> contacts = await ContactsService.getContacts();

      contacts = contacts;
      for(var contact in contacts){
        if(contact.phones?.isNotEmpty ?? false){
          print(contact.displayName);
          contactsList.add({
            "name" : "${contact.displayName}",
            "phone_number" : "${contact.phones?.first.value.toString()}",
          });

        }
      }

      var response = await contactPassUseCase(contactsList: contactsList);
        print("this is response contact ${response?.data}");
      update();
    } else {
      _handleInvalidPermissions(permissionStatus);
    }
    update();
  }

  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted && permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      update();
      return permissionStatus;
    } else {
      update();
      return permission;
    }

  }

  void _handleInvalidPermissions(PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.denied) {
      // Show a message to the user explaining why the permission is needed
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(content: Text('Access to contacts denied')),
      );
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      // Show a message directing the user to the settings
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(content: Text('Contact permissions are permanently denied, we cannot request permissions.')),
      );
    }
    update();
  }
  valueeee({required List<ContactClass> contactsList}){}
}


class ContactClass{
  final String name;
  final String phoneNumber;
  List<Item> emails;

  ContactClass({required this.name, required this.phoneNumber, required this.emails});
}