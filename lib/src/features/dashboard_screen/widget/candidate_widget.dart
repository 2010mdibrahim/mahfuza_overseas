import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mahfuza_overseas/src/core/extensions/extensions.dart';
import 'package:mahfuza_overseas/src/features/dashboard_screen/dashboard_controller.dart';
import 'package:mahfuza_overseas/src/features/login_screen/ui/controller/login_controller.dart';
import 'package:mahfuza_overseas/src/features/passport_process_steps/ui/controller/passport_process_step_controller.dart';

import '../../../core/routes/route_name.dart';
import '../../../core/routes/router.dart';
import '../../../core/utilities/assets_image.dart';
import '../../../core/utilities/common_methods.dart';
import '../../widgets/custom_text.dart';
import '../dashboard_screen.dart';
class CandidateWidget extends StatelessWidget {
  final LoginController splashController;
  final PassportProcessStepController passportProcessStepController;
  const CandidateWidget({super.key, required this.splashController, required this.passportProcessStepController});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("${splashController.userInformation.value.candidate?.fName}"),
        10.ph,
        Image.asset(
          AssetImagePath.mahfuzaLogo,
          height: 60,
          width: 150,
          fit: BoxFit.fill,
        ),
        10.ph,
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 5),
          child: Card(
            child: splashController.userInfoLoading.value
                ? const Center(
              child:
              CircularProgressIndicator(),
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
                    alignment:
                    TextAlign.center,
                    fontSize: 20,
                    fontWeight:
                    FontWeight.w700,
                    color: Colors.green,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets
                      .symmetric(
                      horizontal: 5,
                      vertical: 6),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment
                        .center,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius:
                          BorderRadius
                              .circular(
                              5),
                          child: CommonMethods
                              .cachedNetworkImage(
                            "${splashController.userInformation.value.candidate?.candidatePhoto}",
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
                              "${splashController.userInformation.value.candidate?.fullName}",
                              fontSize: 16,
                              alignment:
                              TextAlign
                                  .start,
                              fontWeight:
                              FontWeight
                                  .w700,
                            ),
                            5.ph,
                            Row(
                              children: [
                                const CustomSimpleText(
                                  text:
                                  "Phone No.: ",
                                  fontSize:
                                  16,
                                  alignment:
                                  TextAlign
                                      .start,
                                  fontWeight:
                                  FontWeight
                                      .w500,
                                ),
                                CustomSimpleText(
                                  text:
                                  "${splashController.userInformation.value.candidate?.phoneNumber}",
                                  fontSize:
                                  16,
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
                                  text:
                                  "DoB: ",
                                  fontSize:
                                  16,
                                  alignment:
                                  TextAlign
                                      .start,
                                  fontWeight:
                                  FontWeight
                                      .w500,
                                ),
                                CustomSimpleText(
                                  text:
                                  "${splashController.userInformation.value.candidate?.dateOfBirth}",
                                  fontSize:
                                  16,
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
                                  text:
                                  "Address: ",
                                  fontSize:
                                  16,
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
                                      "${splashController.userInformation.value.candidate?.currentAddress}",
                                      fontSize:
                                      14,
                                      alignment:
                                      TextAlign
                                          .start,
                                      textOverFlow:
                                      TextOverflow.visible),
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
                  padding: const EdgeInsets
                      .symmetric(
                      horizontal: 10),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                    children: [
                      CustomRow(
                          title:
                          "Referral Agent",
                          value:
                          "${(splashController.userInformation.value.candidate?.agentName?.isEmpty ?? false) ? "--" : splashController.userInformation.value.candidate?.agentName}"),
                      5.ph,
                      CustomRow(
                          title: "Passport",
                          value:
                          "${(splashController.userInformation.value.candidate?.passportNumber?.isEmpty ?? false) ? "--" : splashController.userInformation.value.candidate?.passportNumber}"),
                      5.ph,
                      CustomRow(
                          title:
                          "Passport Expire Date",
                          value:
                          "${(splashController.userInformation.value.candidate?.passportExpiredDate?.isEmpty ?? false) ? "--" : splashController.userInformation.value.candidate?.passportExpiredDate}"),
                      5.ph,
                      CustomRow(
                          title:
                          "Applied Country",
                          value:
                          "${(splashController.userInformation.value.candidate?.interestedCountryName?.isEmpty ?? false) ? "--" : splashController.userInformation.value.candidate?.interestedCountryName}"),
                      5.ph,
                      CustomRow(
                          title:
                          "Applied Job",
                          value:
                          "${(splashController.userInformation.value.candidate?.interestedJobName?.isEmpty ?? false) ? "--" : splashController.userInformation.value.candidate?.interestedJobName}"),
                      5.ph,
                      CustomRow(
                          title:
                          "Process Country",
                          value:
                          "${splashController.userInformation.value.candidate?.processCountryName?.isEmpty ?? false ? splashController.userInformation.value.candidate?.interestedCountryName : splashController.userInformation.value.candidate?.processCountryName}"),
                      5.ph,
                      CustomRow(
                          title:
                          "Process job",
                          value:
                          "${splashController.userInformation.value.candidate?.processJobName?.isEmpty ?? false ? splashController.userInformation.value.candidate?.interestedJobName : splashController.userInformation.value.candidate?.processJobName}"),
                      5.ph,
                      CustomRow(
                          title: "Sponsor",
                          value:
                          "${splashController.userInformation.value.candidate?.sponsorName?.isEmpty ?? false ? "--" : splashController.userInformation.value.candidate?.sponsorName}"),
                      5.ph,
                      CustomRow(
                          title: "Total Step",
                          value:
                          "${passportProcessStepController.passportProcessStepsList.value.processList?.isEmpty ?? false ? "--" : passportProcessStepController.passportProcessStepsList.value.processList?.length.toString()}"),
                      5.ph,
                      CustomRow(
                          title:
                          "Complete Step",
                          value:
                          "${passportProcessStepController.passportProcessStepsList.value.processRecord?.isEmpty ?? false ? "--" : passportProcessStepController.passportProcessStepsList.value.processRecord?.length.toString()}"),
                      5.ph,
                    ],
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(
                      right: 10,
                      bottom: 10),
                  child: Align(
                    alignment:
                    Alignment.centerRight,
                    child: InkWell(
                        onTap: () {
                          RouteGenerator
                              .pushNamed(
                              context,
                              Routes
                                  .passportProcessingStepsScreen);
                        },
                        child:
                        CustomSimpleText(
                          text: "see more>>",
                          color: HexColor(
                              "1d1aff"),
                          fontSize: 14,
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
        // 10.ph,
        // if ((promotionController.promotionalModel
        //     .value.data?.isNotEmpty ??
        //     false))
        //   Column(
        //     crossAxisAlignment:
        //     CrossAxisAlignment.start,
        //     children: [
        //       PromotionCarouselSlider(
        //           list: promotionController
        //               .promotionalModel.value.data),
        //       30.ph,
        //     ],
        //   )
      ],
    ));
  }
}
