import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../core/contacts/ui/contact_controller/contact_controller.dart';

class ContactListPage extends StatefulWidget {
  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ContactController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Contacts'),
          ),
          body: controller.contacts != null
              ? ListView.builder(
            itemCount: controller.contactsList.length,
            itemBuilder: (context, index) {
              var contact = controller.contactsList[index];
              return (contact["name"].isNotEmpty)? ListTile(
                title: Text(contact["name"]),
                subtitle: Text(contact["phone_number"].isNotEmpty ? contact["phone_number"] ?? '' : ''),
              ) : SizedBox();
            },
          )
              : Center(child: CircularProgressIndicator()),
        );
      }
    );
  }
}







// import 'package:contacts_service/contacts_service.dart';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class ContactsPage extends StatefulWidget {
//   const ContactsPage({super.key});
//
//   @override
//   _ContactsPageState createState() => _ContactsPageState();
// }
//
// class _ContactsPageState extends State<ContactsPage> {
//   @override
//   void initState() {
//     super.initState();
//     _askPermissions();
//   }
//
//   Future<void> _askPermissions() async {
//     PermissionStatus permissionStatus = await _getContactPermission();
//     if (permissionStatus != PermissionStatus.granted) {
//       _handleInvalidPermissions(permissionStatus);
//     }
//   }
//
//   Future<PermissionStatus> _getContactPermission() async {
//     PermissionStatus permission = await Permission.contacts.status;
//     if (permission != PermissionStatus.granted &&
//         permission != PermissionStatus.permanentlyDenied) {
//       PermissionStatus permissionStatus = await Permission.contacts.request();
//       return permissionStatus;
//     } else {
//       return permission;
//     }
//   }
//
//   void _handleInvalidPermissions(PermissionStatus permissionStatus) {
//     if (permissionStatus == PermissionStatus.denied) {
//       const snackBar = SnackBar(content: Text('Access to contact data denied'));
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
//       const snackBar =
//       SnackBar(content: Text('Contact data not available on device'));
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     }
//   }
//
//   Future<List<Contact>>? reqContact;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Contacts List'),
//       ),
//       body: Column(
//         children: [
//           ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   reqContact = ContactsService.getContacts();
//                 });
//               },
//               child: const Text("Load Contact")),
//           Expanded(
//               child: FutureBuilder(
//                   future: reqContact,
//                   builder: (context, snp) {
//                     if (snp.connectionState == ConnectionState.done) {
//                       var contacts = snp.data;
//
//                       if (contacts != null) {
//                         return ListView.builder(
//                             shrinkWrap: true,
//                             itemCount: contacts.length,
//                             itemBuilder: (context, index) {
//                               Contact contact = contacts[index];
//
//                               return ListTile(
//                                   title: Text(' ${contact.displayName}'),
//                                   subtitle: Text(contact.phones?.single.value ??
//                                       "not found"));
//                             });
//                       }
//                       return Container();
//                     }
//                     return Container();
//                   })),
//         ],
//       ),
//     );
//   }
// }