import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mahfuza_overseas/src/core/extensions/extensions.dart';
import 'package:mahfuza_overseas/src/core/utilities/common_methods.dart';
import 'package:mahfuza_overseas/src/features/candidate_service_info/ui/controller/candidate_service_info_controller.dart';
class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CandidateServiceInfoController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Services"),
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios)),
          ),
          body: controller.loading.value? const Center(
            child: CircularProgressIndicator(),
          ) : (controller.candidateServiceModel.value.serviceInfo?.isEmpty ?? false) ?  Center(
            child: CommonMethods.notFoundArc(),
          ) : ListView.builder(
            itemCount: controller.candidateServiceModel.value.serviceInfo?.length,
              itemBuilder: (_,index){
              var item = controller.candidateServiceModel.value.serviceInfo?[index];
              return Column(
                children: [
                  if(index == 0)
                    CustomRow(serviceType: "Service Type", country: "Country", work: "Work", date: "Date", from:"heading"),
                  CustomRow(serviceType: item?.serviceType ?? '', country: item?.country ?? '', work: item?.work ?? '', date: DateFormat("yyyy-MM-dd").format(item?.date ?? DateTime.now()), from: "data"),
                ],
              );
              }),
        );
      }
    );
  }
  Widget CustomRow({required String serviceType, required String country, required String work, required String date, required String from}){
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Center(child: Text(serviceType, style: TextStyle(fontWeight: from == "data"? FontWeight.w400 : FontWeight.bold, fontSize: from == "data"? 12 : 13),))),
            10.pw,
            Container(
              height: 20,
              width: 0.5,
              color: Colors.grey,
            ),
            Expanded(child: Center(child: Text(country, style: TextStyle(fontWeight: from == "data"? FontWeight.w400 : FontWeight.bold, fontSize: from == "data"? 12 : 13),))),
            10.pw,
            Container(
              height: 20,
              width: 0.5,
              color: Colors.grey,
            ),
            Expanded(child: Center(child: Text(work, style: TextStyle(fontWeight: from == "data"? FontWeight.w400 : FontWeight.bold, fontSize: from == "data"? 12 : 13),))),
            10.pw,
            Container(
              height: 20,
              width: 0.5,
              color: Colors.grey,
            ),

            Expanded(child: Center(child: Text(date, style: TextStyle(fontWeight: from == "data"? FontWeight.w400 : FontWeight.bold, fontSize: from == "data"? 12 : 13),))),
          ],
        ),
      ),
    );
  }
}
