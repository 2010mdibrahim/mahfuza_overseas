

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mahfuza_overseas/src/core/contacts/data/source/contact_service.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../main.dart';
import '../../../../core/di/app_component.dart';
import '../../data/model/employee_attendance_model.dart';
import '../../domain/repository/employee_attendance_repository.dart';
import '../../domain/usecase/employee_attendance_pass_usecase.dart';

class EmployeeAttendanceController extends GetxController {
  var employeeAttendanceModel = EmployeeAttendanceModel().obs;
  List<String> datesOfAttendanceHistory = [];
  List<Map<String, dynamic>> dateRemarkOfAttendanceHistory = [];
  List<Map<String, dynamic>> countDay = [];
  DateTime date = DateTime.now();
  var attendanceYear = ''.obs;
  var currentStep = 0.obs;
  var loading = false.obs;
  ValueNotifier<DateTime> selectedDate =
  ValueNotifier<DateTime>(DateTime.now());
  CalendarFormat calendarFormat = CalendarFormat.month;
  ValueNotifier<DateTime> dateSelected =
  ValueNotifier<DateTime>(DateTime.now());
  void setDateSelected(DateTime date) {
    dateSelected.value = date;
    update();
  }
  @override
  @override
  void onInit() {
    super.onInit();
    employeeAttendanceFunction();
    selectedDate.addListener(() async {
      await employeeAttendanceFunction();
    });
  }

   employeeAttendanceFunction({bool? isNotSameWithPresentYear}) async {
    if(isNotSameWithPresentYear == false){
      loading.value = true;
    }else{
    loading.value = true;
    }
    datesOfAttendanceHistory.clear();
    dateRemarkOfAttendanceHistory.clear();
    update();
    try {
      EmployeeAttendancePassUseCase employeeAttendancePassUseCase =
      EmployeeAttendancePassUseCase(locator<EmployeeAttendanceRepository>());
      var response = await employeeAttendancePassUseCase(employeeId: box.read("candidateId").toString(), year: isNotSameWithPresentYear == false ? selectedDate.value.year.toString() : DateTime.now().year.toString());
      employeeAttendanceModel.value = response!.data!;
      if(isNotSameWithPresentYear == false){
        attendanceYear.value = selectedDate.value.year.toString();
      }else{
      attendanceYear.value = employeeAttendanceModel.value.attandanceYear ?? '';
      }
      // Future.delayed(const Duration(milliseconds: 700), () async {
      for (var employeeAttendance in employeeAttendanceModel.value.data ?? []) {
        if (employeeAttendance.month == getMonthName(isNotSameWithPresentYear == false ? selectedDate.value.month : DateTime.now().month)) {
          // Ensure attendance data is not null before iterating
          if (employeeAttendance.attandanceData != null) {
            for (var attendanceData in employeeAttendance.attandanceData) {
              if(DateFormat("yyyy-MM").format(DateTime.parse(attendanceData.date)) == DateFormat("yyyy-MM").format(isNotSameWithPresentYear == false ? selectedDate.value :DateTime.now())){
                // Split the date string into year, month, and day parts
                List<String> dateParts = attendanceData.date.split('-');
                print("this is from controller ${attendanceYear.value} ${selectedDate.value}");
                int year = int.parse(dateParts[0]);
                int month = int.parse(dateParts[1]);
                int day = int.parse(dateParts[2]);
                DateTime dateTime = dateCalculation(day,
                    month, year);
                print("this is dateTime ${dateTime.yearMonthDay()}");
                // Add the attendance data to the respective lists
                dateRemarkOfAttendanceHistory.add({
                  'date': DateTime.parse(dateTime.yearMonthDay()), // Use dateTime directly
                  'remark': attendanceData.indicator,
                  'color': attendanceData.color,
                });
                datesOfAttendanceHistory.add(dateTime.toString());
              }

            }
          }
          break; // Exit the loop after processing February
        }
      }

      dateRemarkOfAttendanceHistory =
            dateRemarkOfAttendanceHistory.toSet().toList();
        update();
      // });
    } on PlatformException catch (e) {
      String platformVersion = '${e.message}';
      print(platformVersion);
    } finally {

      loading.value = false;
      update();
    }
    update();
  }
  String getMonthName(int month) {
    const List<String> monthNames = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return monthNames[month - 1]; // month is 1-based, so subtract 1 to get 0-based index
  }
  calendarFormatFunction(CalendarFormat format) {
    if (calendarFormat != format) {
      // setState(() {
      calendarFormat = format;
      // });
    }
    update();
  }
  dateWiseData(){
    datesOfAttendanceHistory.clear();
    dateRemarkOfAttendanceHistory.clear();
    if(attendanceYear.value != selectedDate.value.year.toString()){
      employeeAttendanceFunction(isNotSameWithPresentYear: false);
    }else{
      for (var employeeAttendance in employeeAttendanceModel.value.data ?? []) {
        // Check if the month is "February"
        if (employeeAttendance.month == getMonthName(selectedDate.value.month)) {
          print("This is month only");

          // Ensure attendance data is not null before iterating
          if (employeeAttendance.attandanceData != null) {
            for (var attendanceData in employeeAttendance.attandanceData) {
              print("This is month only1 ${DateFormat("yyyy-MM").format(DateTime.parse(attendanceData.date))}");
              print("This is month only2 ${DateFormat("yyyy-MM").format(DateTime.now())}");
              if(DateFormat("yyyy-MM").format(DateTime.parse(attendanceData.date)) == DateFormat("yyyy-MM").format(selectedDate.value)){
                print("This is employee attendance data ${attendanceData.date}");

                // Split the date string into year, month, and day parts
                List<String> dateParts = attendanceData.date.split('-');
// Extract year, month, and day
                int year = int.parse(dateParts[0]);
                int month = int.parse(dateParts[1]);
                int day = int.parse(dateParts[2]);
                DateTime dateTime = dateCalculation(day,
                    month, year);
                print("this is dateTime ${dateTime.yearMonthDay()}");
                // Add the attendance data to the respective lists
                dateRemarkOfAttendanceHistory.add({
                  'date': DateTime.parse(dateTime.yearMonthDay()), // Use dateTime directly
                  'remark': attendanceData.indicator,
                  'color': attendanceData.color,
                });
                datesOfAttendanceHistory.add(dateTime.toString());
              }

            }
          }
          break; // Exit the loop after processing February
        }
      }
      dateRemarkOfAttendanceHistory =
          dateRemarkOfAttendanceHistory.toSet().toList();
    }

    update();
  }
  DateTime dateCalculation(int days, int months, int years) {
    int year = 0;
    if (years > 2000) {
      year = years;
    } else {
      year = years + 2000;
    }

    int month = months;
    int day = days;
    // Ensure proper formatting with leading zeros if necessary
    String formattedYear = year.toString();
    String formattedMonth = month.toString().padLeft(2, '0');
    String formattedDay = day.toString().padLeft(2, '0');
    String formattedDateString = "$formattedYear-$formattedMonth-$formattedDay";

    // Parse the formatted date string
    return DateTime.parse(formattedDateString);
  }
}
extension SeoDateFormatter on DateTime? {
  String dayMonthYear() {
    try {
      return DateFormat("dd-MM-yyyy").format(DateTime.parse(toString()));
    } on Exception catch (e) {
      return toString();
    }
  }

  String yearMonthDay() {
    try {
      return DateFormat("yyyy-MM-dd").format(DateTime.parse(toString()));
    } on Exception catch (e) {
      return toString();
    }
  }

}