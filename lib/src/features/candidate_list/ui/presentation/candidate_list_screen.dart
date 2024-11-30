import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mahfuza_overseas/src/core/extensions/extensions.dart';
import 'package:mahfuza_overseas/src/features/candidate_list/ui/presentation/flight_widget.dart';
import 'package:mahfuza_overseas/src/features/candidate_list/ui/presentation/onProcess.dart';
import 'package:mahfuza_overseas/src/features/candidate_list/ui/presentation/completed_widget.dart';
import 'package:mahfuza_overseas/src/features/notification/ui/controller/notification_controller.dart';
import 'package:mahfuza_overseas/src/features/widgets/custom_text.dart';

import '../../../../core/routes/route_name.dart';
import '../../../../core/routes/router.dart';
import '../../../../core/utilities/common_methods.dart';
import '../../../passport_process_steps/ui/controller/passport_process_step_controller.dart';
import '../../../widgets/custom_toast.dart';
import '../controller/candidate_list_controller.dart';

class CandidateListScreen extends StatelessWidget {
  const CandidateListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
                length: 3,
                child: Scaffold(
                  appBar: AppBar(
                    title: const Text(
                      "Candidate List",
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
                      TabBar(
                        tabs: [
                          Tab(text: "On Process"),
                          Tab(text: "Completed"),
                          Tab(text: "Flight"),
                        ],
                      ),
                      Expanded(child: TabBarView(
                        children: [
                          OnProcessWidget(),
                          CompletedWidget(),
                          FlightWidget(),
                        ],
                      ),)
                    ],
                  ),  
                ),
              );
  }
}
