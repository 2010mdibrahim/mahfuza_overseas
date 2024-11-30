import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mahfuza_overseas/src/core/extensions/extensions.dart';
import 'package:mahfuza_overseas/src/features/dashboard_screen/dashboard_controller.dart';
import 'package:mahfuza_overseas/src/features/dashboard_screen/widget/agent_widget.dart';
import 'package:mahfuza_overseas/src/features/dashboard_screen/widget/candidate_widget.dart';
import 'package:mahfuza_overseas/src/features/dashboard_screen/widget/employee_widget.dart';
import 'package:mahfuza_overseas/src/features/login_screen/ui/controller/login_controller.dart';
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
import '../passport_process_steps/ui/controller/passport_process_step_controller.dart';
import '../promotion/ui/promotion_widget/promotion_widget.dart';
import 'agent_drawer.dart';
import 'dashboard_drawer.dart';
import 'employee_dashboard_drawer.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ContactController(),
        builder: (contactController) {
          return GetBuilder<LoginController>(
              init: LoginController(),
              // initState: (d){
              //   d.controller?.userInformationFu();
              // },
              builder: (splashController) {
                return GetBuilder(
                    init: PromotionController(),
                    builder: (promotionController) {
                      return GetBuilder(
                          init: PassportProcessStepController(),
                          initState: (passport){
                            passport.controller?.passportProcessStepFunction();
                          },
                          builder: (passportProcessStepController) {
                            return Scaffold(
                              appBar: AppBar(
                                elevation: 0,
                                backgroundColor: Colors.white,
                              ),
                              drawer: box.read("type") ==
                                  "employee" ? EmployeeDashboardDrawer() : box.read("type") == "agent" ? AgentDrawer() :DashboardDrawer(),
                              body: SingleChildScrollView(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  box.read("type") ==
                                          "employee"
                                      ? EmployeeWidget(
                                          splashController: splashController)
                                      : box.read("type") == "agent" ? AgentWidget(splashController: splashController) : CandidateWidget(
                                          splashController: splashController,
                                          passportProcessStepController:
                                              passportProcessStepController),
                                  10.ph,
                                  if ((promotionController.promotionalModel
                                          .value.data?.isNotEmpty ??
                                      false))
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        PromotionCarouselSlider(
                                            list: promotionController
                                                .promotionalModel.value.data),
                                        30.ph,
                                      ],
                                    )
                                ],
                              )),
                            );
                          });
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
