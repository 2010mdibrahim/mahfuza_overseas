import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../core/routes/route_name.dart';
import '../../core/routes/router.dart';
import '../../core/source/dio_client.dart';
import '../../core/utilities/common_methods.dart';

class EmployeeDashboardDrawer extends StatelessWidget {
  const EmployeeDashboardDrawer({super.key});

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
                Text("${box.read("fullName").toString()}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),)
              ],
            ),
          ),//DrawerHeader
          ListTile(
            leading: const Icon(Icons.perm_contact_calendar_outlined),
            title: const Text('Attendance'),
            onTap: () {
              Navigator.pop(context);
              RouteGenerator.pushNamed(context, Routes.attendance);

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
