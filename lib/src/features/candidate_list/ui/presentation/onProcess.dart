import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahfuza_overseas/src/core/extensions/extensions.dart';

import '../../../../core/routes/route_name.dart';
import '../../../../core/routes/router.dart';
import '../../../../core/utilities/common_methods.dart';
import '../../../passport_process_steps/ui/controller/passport_process_step_controller.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_toast.dart';
import '../controller/candidate_list_controller.dart';

class OnProcessWidget extends StatelessWidget {
  const OnProcessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: CandidateListController(),
        builder: (controller) {
          return GetBuilder<PassportProcessStepController>(
              builder: (passportController) {
                return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomSimpleText(
                              text: "Total On Process Candidate",
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                            CustomSimpleText(
                              text: "${controller.onProcessModel.length}",
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: controller.loading.value
                              ? const Center(
                            child: CircularProgressIndicator(),
                          )
                              : (controller.onProcessModel.isEmpty ??
                              false)
                              ? CommonMethods.notFoundArc()
                              : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                                itemCount: controller
                                    .onProcessModel.length,
                                itemBuilder: (_, index) {
                                  var item = controller
                                      .onProcessModel[index];
                                  return InkWell(
                                    onTap: () {
                                      RouteGenerator
                                          .pushNamed(
                                          context,
                                          Routes
                                              .passportProcessingStepsScreen, arguments: [
                                        item?.id
                                      ]);
                                      passportController.passportProcessStepFunction(candidateId: item?.id);
                                    },
                                    child:  SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                onTap: (){
                                                  viewPhotoZoomable(
                                                      context, item?.candidatePhoto ?? '');
                                                },
                                                child: SizedBox(
                                                  height: 60,
                                                  width: 60,
                                                  child: CircleAvatar(
                                                    backgroundColor: Color.fromARGB(255, 165, 255, 137),
                                                    radius: 5, // Adjust the radius as needed
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(5),
                                                      child: CommonMethods.cachedNetworkImage(
                                                        "${item?.candidatePhoto}",
                                                        height: 100.0, // Adjust the height as needed
                                                        width: 100.0, // Adjust the width as needed
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              10.pw,
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  CustomSimpleText(
                                                    text: "${item?.fullName}",
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  CustomSimpleText(
                                                    text: "Type: ${item?.candidateType}",
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.normal,
                                                  ),
                                                  CustomSimpleText(
                                                    text: "pass No: ${item?.passportNumber}",
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.normal,
                                                  ),
                                                  CustomSimpleText(
                                                    text: "Interested Country Name: ${item?.interestedCountryName}",
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.normal,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                  );
                                }),
                          ))
                    ],
                  );
              }
          );
        });
  }
}
