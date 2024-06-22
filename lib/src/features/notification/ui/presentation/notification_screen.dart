import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mahfuza_overseas/src/core/extensions/extensions.dart';
import 'package:mahfuza_overseas/src/features/notification/ui/controller/notification_controller.dart';
import 'package:mahfuza_overseas/src/features/widgets/custom_text.dart';

import '../../../../core/utilities/common_methods.dart';
import '../../../widgets/custom_toast.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: NotificationController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Notification",
                style: TextStyle(fontSize: 19),
              ),
              leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios)),
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            body: Column(
              children: [
                Expanded(
                    child: controller.loading.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : (controller.notificationModel.value.data?.isEmpty ??
                                false)
                            ? CommonMethods.notFoundArc()
                            : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView.builder(
                                  itemCount: controller
                                      .notificationModel.value.data?.length,
                                  itemBuilder: (_, index) {
                                    var item = controller
                                        .notificationModel.value.data?[index];
                                    return InkWell(
                                      onTap: () {
                                        viewPhotoZoomable(
                                            context, item?.promotionBanner ?? '');
                                        controller.notificationUpdateFunction(
                                            updateNotificationId: item?.id);
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(bottom: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                            color: item?.view == "0"
                                                ? HexColor("9E2166")
                                                .withOpacity(0.1)
                                                : Colors.white,
                                            border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(0.3))),
                                        child: SizedBox(
                                          width: MediaQuery.of(context).size.width,
                                          child: Card(
                                            elevation: 0,
                                            color: item?.view == "0"
                                                ? HexColor("9E2166")
                                                .withOpacity(0.02)
                                                : Colors.white,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment: Alignment.centerRight,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: CustomRichText(
                                                        title: "Start in: ",
                                                        text: "${item?.data}",
                                                        titleColor: Colors.red,
                                                        textColor: Colors.black),
                                                  ),
                                                ),
                                                CommonMethods.cachedNetworkImage(
                                                    "${item?.promotionBanner}",
                                                    height: 150.0,
                                                    width: MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                    fit: BoxFit.fill),
                                                10.ph,
                                                CustomSimpleText(
                                                  text: "${item?.promotionTitle}",
                                                  fontSize: 14,
                                                ),
                                                5.ph,
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ))
              ],
            ),
          );
        });
  }
}
