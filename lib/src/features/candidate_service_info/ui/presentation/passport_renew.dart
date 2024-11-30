import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';
import 'package:mahfuza_overseas/src/core/extensions/extensions.dart';
import 'package:mahfuza_overseas/src/features/candidate_service_info/data/model/candidate_service_info_model.dart';
import 'package:mahfuza_overseas/src/features/widgets/custom_text.dart';

import '../../../../core/utilities/common_methods.dart';
import '../../../widgets/custom_toast.dart';
import '../controller/candidate_service_info_controller.dart';
class PassportRenewScreen extends StatelessWidget {
  const PassportRenewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: CandidateServiceInfoController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Passport Renew"),
              leading: IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back_ios)),
            ),
            body: controller.loading.value? const Center(
              child: CircularProgressIndicator(),
            ) : (controller.candidateServiceModel.value.passportRenew?.isEmpty ?? false) ?  Center(
              child: CommonMethods.notFoundArc(),
            ) : ListView.builder(
                itemCount: controller.candidateServiceModel.value.passportRenew?.length,
                itemBuilder: (_,index){
                  var item = controller.candidateServiceModel.value.passportRenew?[index];

                  return InkWell(
                    onTap: (){
                      viewPhotoZoomable(context, item?.newPassportScanCopy ?? '');
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color.fromARGB(255, 165, 255, 137),
                              radius: 30, // Adjust the radius as needed
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: CommonMethods.cachedNetworkImage(
                                  "${item?.newPassportScanCopy}",
                                  height: 100.0, // Adjust the height as needed
                                  width: 100.0, // Adjust the width as needed
                                ),
                              ),
                            ),
                            10.pw,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomRichText(title: "Passport Type: ", text: item?.newPassportType,),
                                CustomRichText(title: "Passport Number: ", text: item?.newPassportNumber,),
                                CustomRichText(title: "Place Name: ", text: item?.newPassportIssuePlaceName,),
                                CustomRichText(title: "validity year: ", text: item?.newValidityYear,),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          );
        }
    );
  }
// void showDialogDetails({required BuildContext context, PassportRenew? item}){
//     return showErrorDialog(context: context,widget: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: Column(
//                   children: [
//                     CustomSimpleText(text: "Details"),
//                     Container(width: 80, height: 1, color: Colors.grey,),
//                   ],
//                 ),
//               ),
//               Icon(Icons.close, size: 20,color: Colors.red,)
//             ],
//           ),
//           10.ph,
//           Row(
//             // mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: CommonMethods.cachedNetworkImage(
//                   "${item?.newPassportScanCopy}",
//                   height: 150.0, // Adjust the height as needed
//                   width: 150.0, // Adjust the width as needed
//                 ),
//               ),
//               Column(
//                 children: [
//
//                 ],
//               )
//             ],
//           ),
//         ],
//       ),
//     ));
// }
}
