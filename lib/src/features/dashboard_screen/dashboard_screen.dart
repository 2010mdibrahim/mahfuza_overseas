import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mahfuza_overseas/src/core/extensions/extensions.dart';
import 'package:mahfuza_overseas/src/features/dashboard_screen/dashboard_controller.dart';
import 'package:mahfuza_overseas/src/features/promotion/ui/controller/promotion_controller.dart';
import 'package:mahfuza_overseas/src/features/splash_screen/splash_controller.dart';
import 'package:mahfuza_overseas/src/features/widgets/custom_text.dart';

import '../../../main.dart';
import '../../core/contacts/ui/contact_controller/contact_controller.dart';
import '../../core/routes/route_name.dart';
import '../../core/routes/router.dart';
import '../../core/source/dio_client.dart';
import '../../core/utilities/assets_image.dart';
import '../../core/utilities/common_methods.dart';
import '../promotion/ui/promotion_widget/promotion_widget.dart';
import 'dashboard_drawer.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ContactController(),
        builder: (contactController) {
          return GetBuilder<DashboardController>(
              init: DashboardController(),
              builder: (splashController) {
                return GetBuilder(
                    init: PromotionController(),
                    builder: (promotionController) {
                      return Scaffold(
                        appBar: AppBar(
                          elevation: 0,
                          backgroundColor: Colors.white,
                        ),
                        drawer: DashboardDrawer(),
                        body: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              10.ph,
                              Image.asset(
                                AssetImagePath.mahfuzaLogo,
                                height: 60,
                                width: 150,
                                fit: BoxFit.fill,
                              ),
                              10.ph,
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Card(
                                  child: splashController.loading.value
                                      ? const Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            10.ph,
                                            const Center(
                                              child: CustomSimpleText(
                                                text: "Infomation",
                                                alignment: TextAlign.center,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.green,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 6),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      child: CommonMethods
                                                          .cachedNetworkImage(
                                                        "${splashController.userInformation.value.candidatePhoto}",
                                                        // height: 120.0,
                                                        width: 100.0,
                                                      ),
                                                    ),
                                                  ),
                                                  10.pw,
                                                  Expanded(
                                                    flex: 2,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        CustomSimpleText(
                                                          text:
                                                              "${splashController.userInformation.value.fullName}",
                                                          fontSize: 16,
                                                          alignment:
                                                              TextAlign.start,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                        5.ph,
                                                        Row(
                                                          children: [
                                                            const CustomSimpleText(
                                                              text:
                                                                  "Phone No.: ",
                                                              fontSize: 16,
                                                              alignment:
                                                                  TextAlign
                                                                      .start,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                            CustomSimpleText(
                                                              text:
                                                                  "${splashController.userInformation.value.phoneNumber}",
                                                              fontSize: 16,
                                                              alignment:
                                                                  TextAlign
                                                                      .start,
                                                            ),
                                                          ],
                                                        ),
                                                        5.ph,
                                                        Row(
                                                          children: [
                                                            const CustomSimpleText(
                                                              text: "DOB: ",
                                                              fontSize: 16,
                                                              alignment:
                                                                  TextAlign
                                                                      .start,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                            CustomSimpleText(
                                                              text:
                                                                  "${splashController.userInformation.value.dateOfBirth}",
                                                              fontSize: 16,
                                                              alignment:
                                                                  TextAlign
                                                                      .start,
                                                            ),
                                                          ],
                                                        ),
                                                        5.ph,
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const CustomSimpleText(
                                                              text: "Address: ",
                                                              fontSize: 16,
                                                              alignment:
                                                                  TextAlign
                                                                      .start,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                            Expanded(
                                                              child: CustomSimpleText(
                                                                  text:
                                                                      "${splashController.userInformation.value.currentAddress}",
                                                                  fontSize: 14,
                                                                  alignment:
                                                                      TextAlign
                                                                          .start,
                                                                  textOverFlow:
                                                                      TextOverflow
                                                                          .visible),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            10.ph,
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomRow(
                                                      title: "Referral Agent",
                                                      value:
                                                          "${(splashController.userInformation.value.agentName?.isEmpty ?? false) ? "--" : splashController.userInformation.value.agentName}"),
                                                  5.ph,
                                                  CustomRow(
                                                      title: "Passport",
                                                      value:
                                                          "${(splashController.userInformation.value.passportNumber?.isEmpty ?? false) ? "--" : splashController.userInformation.value.passportNumber}"),
                                                  5.ph,
                                                  CustomRow(
                                                      title:
                                                          "Passport Expire Date",
                                                      value:
                                                          "${(splashController.userInformation.value.passportExpiredDate?.isEmpty ?? false) ? "--" : splashController.userInformation.value.passportExpiredDate}"),
                                                  5.ph,
                                                  CustomRow(
                                                      title: "Applied Country",
                                                      value:
                                                          "${(splashController.userInformation.value.interestedCountryName?.isEmpty ?? false) ? "--" : splashController.userInformation.value.interestedCountryName}"),
                                                  5.ph,
                                                  CustomRow(
                                                      title: "Applied Job",
                                                      value:
                                                          "${(splashController.userInformation.value.interestedJobName?.isEmpty ?? false) ? "--" : splashController.userInformation.value.interestedJobName}"),
                                                  5.ph,
                                                  CustomRow(
                                                      title: "Process Country",
                                                      value:
                                                          "${splashController.userInformation.value.processCountryName?.isEmpty ?? false ? splashController.userInformation.value.interestedCountryName : splashController.userInformation.value.processCountryName}"),
                                                  5.ph,
                                                  CustomRow(
                                                      title: "Process job",
                                                      value:
                                                          "${splashController.userInformation.value.processJobName?.isEmpty ?? false ? splashController.userInformation.value.interestedJobName : splashController.userInformation.value.processJobName}"),
                                                  5.ph,
                                                  CustomRow(
                                                      title: "Sponsor",
                                                      value:
                                                          "${splashController.userInformation.value.sponsorName?.isEmpty ?? false ? "--" : splashController.userInformation.value.sponsorName}"),
                                                  5.ph,
                                                  CustomRow(
                                                      title: "Total Step",
                                                      value:
                                                          "${splashController.userInformation.value.totalStep?.isEmpty ?? false ? "--" : splashController.userInformation.value.totalStep}"),
                                                  5.ph,
                                                  CustomRow(
                                                      title: "Complete Step",
                                                      value:
                                                          "${splashController.userInformation.value.runingStep?.isEmpty ?? false ? "--" : splashController.userInformation.value.runingStep}"),
                                                  5.ph,
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10, bottom: 10),
                                              child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: InkWell(
                                                    onTap: () {
                                                      RouteGenerator.pushNamed(
                                                          context,
                                                          Routes
                                                              .passportProcessingStepsScreen);
                                                    },
                                                    child: CustomSimpleText(
                                                      text: "see more>>",
                                                      color: HexColor("1d1aff"),
                                                      fontSize: 14,
                                                    )),
                                              ),
                                            )
                                          ],
                                        ),
                                ),
                              ),
                              10.ph,
                              if ((promotionController.promotionalModel.value
                                      .data?.isNotEmpty ??
                                  false))
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PromotionCarouselSlider(
                                        list: promotionController
                                            .promotionalModel.value.data),
                                    30.ph,
                                  ],
                                )
                            ],
                          ),
                        ),
                      );
                    });
              });
        });
  }
}

Widget CustomRow({required String title, required String value}) {
  return Row(
    children: [
      Expanded(
        child: CustomSimpleText(
          text: title,
          alignment: TextAlign.start,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      Text(":"),
      10.pw,
      Expanded(
        child: CustomSimpleText(
          text: value,
          alignment: TextAlign.start,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
}
