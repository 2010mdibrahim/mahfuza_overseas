import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahfuza_overseas/src/features/login_screen/ui/controller/login_controller.dart';

import '../../../main.dart';
import '../../core/routes/route_name.dart';
import '../../core/routes/router.dart';
import '../../core/source/dio_client.dart';
import '../../core/utilities/common_methods.dart';
import 'dashboard_controller.dart';

class AgentDrawer extends StatelessWidget {
  const AgentDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:GetBuilder<LoginController>(
        builder: (dashboardController) {
          return ListView(
            padding: const EdgeInsets.all(0),
            children: [
              Container(
                height: 150,
                color: Colors.green,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 165, 255, 137),
                      radius: 30, // Adjust the radius as needed
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CommonMethods.cachedNetworkImage(
                          "${dashboardController.userInformation.value.candidate?.agentPhoto}",
                          height: 100.0, // Adjust the height as needed
                          width: 100.0, // Adjust the width as needed
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text("${dashboardController.userInformation.value.candidate?.agentName}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),)
                  ],
                ),
              ),//DrawerHeader
              ListTile(
                leading: const Icon(Icons.settings_accessibility_sharp),
                title: const Text('My Candidate List'),
                onTap: () {
                  Navigator.pop(context);
                  RouteGenerator.pushNamed(context, Routes.candidateList);
                },
              ),
            box.read("showTransaction") == "0" ? const SizedBox.shrink() :  ListTile(
                leading: const Icon(Icons.money),
                title: const Text('Transaction History'),
                onTap: () {
                  Navigator.pop(context);
                  RouteGenerator.pushNamed(context, Routes.agentTransactionListScreen);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('LogOut'),
                onTap: () {
                  box.erase();
                  RouteGenerator.pushNamedAndRemoveAll(context, Routes.loginScreen);
                },
              ),
            ],
          );
        }
      ),
    );
  }
}
