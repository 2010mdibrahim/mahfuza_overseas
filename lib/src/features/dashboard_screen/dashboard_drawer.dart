import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../core/routes/route_name.dart';
import '../../core/routes/router.dart';
import '../../core/source/dio_client.dart';
import '../../core/utilities/common_methods.dart';

class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
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
                       "${box.read("photo").toString()}",
                       height: 100.0, // Adjust the height as needed
                       width: 100.0, // Adjust the width as needed
                     ),
                   ),
                 ),
                 SizedBox(height: 8),
                 Text(box.read("fullName").toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),)
               ],
             ),
           ),//DrawerHeader
          ListTile(
            leading: const Icon(Icons.settings_accessibility_sharp),
            title: const Text('Service'),
            onTap: () {
              Navigator.pop(context);
              RouteGenerator.pushNamed(context, Routes.servicesScreen);

            },
          ),
          ListTile(
            leading: const Icon(Icons.model_training),
            title: const Text('Passport Renew'),
            onTap: () {
              Navigator.pop(context);
              RouteGenerator.pushNamed(context, Routes.passportRenew);
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications_active),
            title: const Text('Notification'),
            onTap: () {
              Navigator.pop(context);
              RouteGenerator.pushNamed(context, Routes.notificationPage);
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
      ),
    );
  }
}
