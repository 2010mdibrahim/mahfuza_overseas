// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:mahfuza_overseas/src/core/extensions/extensions.dart';
import 'package:mahfuza_overseas/src/features/attendance/data/model/employee_attendance_model.dart';
import '../controller/attendance_controller.dart';
import 'package:table_calendar/table_calendar.dart';

Widget AttendanceCalenderWidget(
    {required BuildContext context,
    required List<Map<String, dynamic>> dateRemark,
    required List<String> attendanceDate,
    required EmployeeAttendanceController controller,
    required EmployeeAttendanceModel attendenceResponseModel}) {
  return ValueListenableBuilder(
      valueListenable: controller.selectedDate,
      builder: (BuildContext context, DateTime value, Widget? child) {
        return GetBuilder(
            init: EmployeeAttendanceController(),
            builder: (s) {
              return controller.loading.value == true
                  ? const Center(
                      child: SizedBox(
                          height: 40, child: CircularProgressIndicator()))
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Card(
                              child: Column(
                                children: [
                                  TableCalendar(
                                    firstDay: DateTime.utc(2010),
                                    lastDay: DateTime(DateTime.now().year,
                                            DateTime.now().month + 1, 1)
                                        .subtract(Duration(days: 1)),
                                    focusedDay: controller.selectedDate.value,
                                    calendarFormat: controller.calendarFormat,
                                    onFormatChanged: (format) {
                                      controller.calendarFormatFunction(format);
                                    },
                                    eventLoader: (DateTime date) {
                                      DateFormat dFormat =
                                          DateFormat("yyyy-MM-dd");
                                      String parsedInputDate =
                                          dFormat.format(date);

                                      List<String> tmp =
                                          attendanceDate.where((data) {
                                        DateTime parsedDate =
                                            DateTime.parse(data);
                                        String formattedDate =
                                            dFormat.format(parsedDate);

                                        if (formattedDate == parsedInputDate) {
                                          // print("event loader date date2 ${parsedInputDate}");
                                          return formattedDate ==
                                              parsedInputDate;
                                        } else {
                                          return false;
                                        }
                                      }).toList();
                                      return tmp;
                                    },
                                    locale: 'en_US',
                                    startingDayOfWeek:
                                        StartingDayOfWeek.saturday,
                                    selectedDayPredicate: (day) {
                                      return isSameDay(
                                          controller.dateSelected.value, day);
                                    },
                                    onDaySelected: (selectedDay, focusedDay) {
                                      if (!isSameDay(
                                          controller.dateSelected.value,
                                          selectedDay)) {
                                        controller.setDateSelected(selectedDay);
                                        // controller.dialogOpen(true);
                                        String selectedDateString =
                                            DateFormat("yyyy-MM-dd").format(
                                                controller.dateSelected.value);
                                        // for (var element in dateRemark) {
                                        //   String formattedDateString = DateFormat('yyyy-MM-dd').format(element['date']);
                                        //
                                        //   if (selectedDateString == formattedDateString) {
                                        //     // controller.setClickedOrNot(true);
                                        //     print("true true");
                                        //     presentDetails(
                                        //         context,
                                        //         DateFormat("yyyy-MM-dd").parse(controller.dateSelected.value.toString()),
                                        //         element,
                                        //         controller
                                        //     );
                                        //     break;  // Exit the loop after the dialog is opened
                                        //   }
                                        // }
                                      }
                                    },
                                    onPageChanged: (DateTime d) {
                                      // Add one month to the date
                                      DateTime newDate =
                                          DateTime(d.year, d.month, d.day);

                                      // Format the new date as desired
                                      DateTime formattedNewDate =
                                          DateFormat('yyyy-MM-dd').parse(
                                              DateFormat('yyyy-MM-dd')
                                                  .format(newDate));

                                      if (formattedNewDate
                                          .toString()
                                          .isNotEmpty) {
                                        controller.selectedDate.value =
                                            formattedNewDate;
                                        controller.dateWiseData();
                                      } else {
                                        // Handle the case when formattedNewDate is null
                                        print("formattedNewDate is null");
                                      }
                                    },
                                    calendarStyle: const CalendarStyle(
                                        canMarkersOverflow: false,
                                        todayDecoration: BoxDecoration(
                                            color: Colors.transparent),
                                        isTodayHighlighted: false,
                                        selectedDecoration: BoxDecoration(
                                            color: Colors.transparent,
                                            shape: BoxShape.circle,
                                            borderRadius: null,
                                            backgroundBlendMode:
                                                BlendMode.hardLight),
                                        markersMaxCount:
                                            1, // Position markers at the bottom of the day cell
                                        markersAlignment:
                                            Alignment.bottomCenter,
                                        // markerDecoration:
                                        //     const BoxDecoration(shape: BoxShape.rectangle),
                                        selectedTextStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16.0,
                                        ),
                                        todayTextStyle: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16.0,
                                          color: Colors.black,
                                        )),
                                    headerStyle: HeaderStyle(
                                        formatButtonDecoration: BoxDecoration(
                                          color: Colors.brown,
                                          borderRadius:
                                              BorderRadius.circular(22.0),
                                        ),
                                        formatButtonTextStyle: const TextStyle(
                                            color: Colors.white),
                                        formatButtonShowsNext: false,
                                        decoration: BoxDecoration(
                                            color: Colors.blue.withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        headerMargin:
                                            const EdgeInsets.only(bottom: 10)),
                                    calendarBuilders: CalendarBuilders(
                                      markerBuilder:
                                          (BuildContext context, date, events) {
                                        if (events.isEmpty ||
                                            dateRemark.length < events.length) {
                                          return const SizedBox();
                                        }

                                        Color? color = Colors.transparent;
                                        // Create a new list with unique dates
                                        var uniqueDates =
                                            dateRemark.toSet().toList();
                                        // Create a new set to store unique values
                                        var uniqueValues = <String>{};
                                        for (var dates in uniqueDates) {
                                          String value = '';
                                          for (var eventDate in events) {
                                            print("eventDate ${eventDate}");
                                            if (DateFormat("yyyy-MM-dd").format(
                                                    DateTime.parse(eventDate
                                                        .toString())) ==
                                                DateFormat("yyyy-MM-dd")
                                                    .format(dates['date'])) {
                                              if (dates['remark'] == "H") {
                                                color =
                                                    HexColor(dates["color"]);
                                                value = dates['remark'];
                                              } else if (dates['remark'] ==
                                                  "L") {
                                                color =
                                                    HexColor(dates["color"]);
                                                value = dates['remark'];
                                              } else if (dates['remark'] ==
                                                  "H") {
                                                color =
                                                    HexColor(dates["color"]);
                                                value = dates['remark'];
                                              } else if (dates['remark'] ==
                                                  "W") {
                                                color =
                                                    HexColor(dates["color"]);
                                                value = dates['remark'];
                                              } else if (dates['remark'] ==
                                                  "P") {
                                                color =
                                                    HexColor(dates["color"]);
                                                value = dates['remark'];
                                                // print("value hot2 $value");
                                              } else if (dates['remark'] ==
                                                  "A") {
                                                color =
                                                    HexColor(dates["color"]);
                                                value = dates['remark'];
                                              } else if (dates['remark'] ==
                                                  "--") {
                                                value = '';
                                                color = Colors.transparent;
                                              } else {
                                                value = '';
                                                print("Calender no data found");
                                              }
                                              uniqueValues.add(value);
                                            }
                                          }
                                        }
                                        return ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: uniqueValues.length,
                                          itemBuilder: (context, index) {
                                            String value =
                                                uniqueValues.elementAt(index);
                                            return Center(
                                              child: value.isEmpty
                                                  ? const SizedBox(
                                                      height: 30,
                                                      width: 30,
                                                      child:
                                                          CircularProgressIndicator(),
                                                    )
                                                  : Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              top: 30),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              1),
                                                      child: Text(
                                                        value,
                                                        style: TextStyle(
                                                            color: color,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ), // Show data when uniqueValues is not empty
                                                    ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                            ),
                            20.ph,
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      5.ph,
                                      Row(
                                        children: [
                                          Expanded(
                                            child: RichText(
                                              text: TextSpan(
                                                text: 'Total Present: ',
                                                style:
                                                    DefaultTextStyle.of(context)
                                                        .style.copyWith(color: HexColor("#04a08b")),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text:
                                                      attendenceResponseModel.totalNumberOfPresent == null ? "0" :'${attendenceResponseModel.totalNumberOfPresent}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: RichText(
                                              text: TextSpan(
                                                text: 'Total Absent: ',
                                                style:
                                                    DefaultTextStyle.of(context)
                                                        .style.copyWith(color: HexColor("#ff562f")),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text:
                                                      attendenceResponseModel.totalNumberOfAbsent == null ? "0" : '${attendenceResponseModel.totalNumberOfAbsent}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      10.ph,
                                      Row(
                                        children: [
                                          Expanded(
                                            child: RichText(
                                              text: TextSpan(
                                                text: 'Total Holiday: ',
                                                style:
                                                    DefaultTextStyle.of(context)
                                                        .style.copyWith(color: HexColor("#00baff")),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text:
                                                      attendenceResponseModel.totalNumberOfHolyday == null ? "0" : '${attendenceResponseModel.totalNumberOfHolyday}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: RichText(
                                              text: TextSpan(
                                                text: 'Total Weekend: ',
                                                style:
                                                    DefaultTextStyle.of(context)
                                                        .style.copyWith(color: HexColor("#ff9920")),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text:
                                                      attendenceResponseModel.totalNumberOfWeekend == null ? "0" :'${attendenceResponseModel.totalNumberOfWeekend}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      10.ph,
                                      Row(
                                        children: [
                                          Expanded(
                                            child: RichText(
                                              text: TextSpan(
                                                text: 'Total Leave: ',
                                                style:
                                                    DefaultTextStyle.of(context)
                                                        .style.copyWith(color: Colors.deepPurpleAccent),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text:
                                                      attendenceResponseModel.totalNumberOfLeave == null ? "0" : '${attendenceResponseModel.totalNumberOfLeave}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: RichText(
                                              text: TextSpan(
                                                text: 'Total Days: ',
                                                style:
                                                    DefaultTextStyle.of(context)
                                                        .style.copyWith(color: Colors.teal),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text:
                                                      attendenceResponseModel.totalNumberOfDays == null ? "0" :'${attendenceResponseModel.totalNumberOfDays}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      10.ph,
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
            });
      });
}

// Future<void> presentDetails(
//     BuildContext context,
//     DateTime selectedDay, Map<String, dynamic> element, EmployeeAttendanceController controller,) {
//   return showDialog<void>(
//     context: context,
//     barrierDismissible: false,
//     builder: (BuildContext context) {
//       return GetBuilder(
//         init: EmployeeAttendanceController(),
//         builder: (controllera) {
//           return AlertDialog(
//             backgroundColor: Colors.white,
//             title: Text(
//               "Details",
//               style: TextStyle(color: Colors.blue),
//             ),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Check In".toUpperCase(),
//                       style: TextStyle(
//                         color: Colors.grey.shade600,
//                       ),
//                     ),
//                     Text(
//                       "${element['checkin']} am",
//                       style: TextStyle(
//                         color: Colors.grey.shade600,
//                       ),
//                     ),
//                   ],
//                 ),
//                 20.ph,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Check out".toUpperCase(),
//                       style: TextStyle(
//                         color: Colors.grey.shade600,
//                       ),
//                     ),
//                     Text(
//                       "${element['checkout'].replaceAll("weekPresent", "")} pm",
//                       style: TextStyle(
//                         color: Colors.grey.shade600,
//                       ),
//                     ),
//                   ],
//                 ),
//                 10.ph,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         "Working Hours".toUpperCase(),
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                           color: Colors.grey.shade600,
//                         ),
//                       ),
//                     ),
//                     5.pw,
//                     // Expanded(
//                     //   child: Text(
//                     //     controller.workHours(checkin: element['checkin'], checkout: element['checkout']),
//                     //     textAlign: TextAlign.end,
//                     //     style: TextStyle(
//                     //       color: Colors.grey.shade600,
//                     //     ),
//                     //   ),
//                     // ),
//                   ],
//                 ),
//                 if(element['note'].toString().isNotEmpty)
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Reason: ",
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                         color: Colors.grey.shade600,
//                       ),
//                     ),
//                     Expanded(
//                       child: Text(
//                         element['note'] == '' || element['note'] == null  ? '' : "${element['note']}",
//                         textAlign: TextAlign.justify,
//                         style: TextStyle(
//                           color: Colors.grey.shade600,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   // controller.setClickedOrNot(false);
//                   Navigator.of(context).pop();
//                 },
//                 style: TextButton.styleFrom(
//                   foregroundColor: Colors.white, backgroundColor: Colors.grey,
//                 ),
//                 child: const Text("OK"),
//               ),
//             ],
//           );
//         }
//       );
//     },
//   );
// }
