import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahfuza_overseas/src/features/attendance/presentation/controller/attendance_controller.dart';

import '../widget/attendance_calender_widget.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmployeeAttendanceController>(
      init: EmployeeAttendanceController(),
        builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Attendance"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(false),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: AttendanceCalenderWidget(
                  context: context,
                  dateRemark: controller.dateRemarkOfAttendanceHistory,
                  attendanceDate: controller.datesOfAttendanceHistory,
                  controller: controller,
                  attendenceResponseModel:
                      controller.employeeAttendanceModel.value),
            )
          ],
        ),
      );
    });
  }
}
