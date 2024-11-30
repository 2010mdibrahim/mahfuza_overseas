import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mahfuza_overseas/src/core/extensions/extensions.dart';
import 'package:mahfuza_overseas/src/features/candidate_list/ui/presentation/flight_widget.dart';
import 'package:mahfuza_overseas/src/features/candidate_list/ui/presentation/onProcess.dart';
import 'package:mahfuza_overseas/src/features/candidate_list/ui/presentation/completed_widget.dart';
import 'package:mahfuza_overseas/src/features/notification/ui/controller/notification_controller.dart';
import 'package:mahfuza_overseas/src/features/widgets/custom_text.dart';
import 'package:photo_view/photo_view.dart';

import '../../../../core/contacts/data/source/contact_service.dart';
import '../../../../core/routes/route_name.dart';
import '../../../../core/routes/router.dart';
import '../../../../core/utilities/common_methods.dart';
import '../../../passport_process_steps/ui/controller/passport_process_step_controller.dart';
import '../../../widgets/custom_toast.dart';
import '../controller/agent_transaction_list_controller.dart';

class AgentTransactionListScreen extends StatelessWidget {
  const AgentTransactionListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AgentTransactionListModelController>(
      init: AgentTransactionListModelController(),
      builder: (agentTransactionController) {
        return Scaffold(
                      appBar: AppBar(
                        title: const Text(
                          "Transaction History",
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
                      body: agentTransactionController.loading.value == true ? const Center(
                        child: CircularProgressIndicator(),
                      ) : agentTransactionController.agentTransactionListModel.value.data?.isEmpty ?? false ? CommonMethods.notFoundArc() : ListView.builder(
                          itemCount: agentTransactionController.agentTransactionListModel.value.data?.length ?? 0,
                          itemBuilder: (_,index){
                            var item = agentTransactionController.agentTransactionListModel.value.data?[index];
                            return InkWell(
                              onTap: (){
                                print("link http://erp.mahfuza-overseas.com/mahfuza_v2/${item?.attachment ?? ''}");
                                showDialog(
                                    context: context,
                                    builder: (context) => PhotoView(
                                      imageProvider: CachedNetworkImageProvider("http://erp.mahfuza-overseas.com/mahfuza_v2/${item?.attachment ?? ''}"),
                                    ));
                              },
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  CustomSimpleText(text: "Name: ${item?.particularName}", fontSize: 13, fontWeight: FontWeight.w400,alignment: TextAlign.start),
                                                  2.ph,
                                                  CustomSimpleText(text: "Transaction Type: ${item?.transactionType}", fontSize: 11,alignment: TextAlign.start,),
                                                  2.ph,
                                                  CustomSimpleText(text: "Transaction Method: ${item?.accountHeadName}", fontSize: 11,alignment: TextAlign.start),
                                                ],
                                              )),
                                          5.pw,
                                          Expanded(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  CustomSimpleText(text: "Transaction Amount: ${item?.bdtAmount} ${item?.currencyName}", fontSize: 12, fontWeight: FontWeight.w400,alignment: TextAlign.start),
                                                  2.ph,
                                                  CustomSimpleText(text: "Note: ${item?.note}", fontSize: 11,alignment: TextAlign.start),
                                                  2.ph,

                                                ],
                                              )),
                                        ],
                                      ),
                                      5.ph,
                                      CustomSimpleText(text: "Transaction Note: ${item?.transactionNote}", fontSize: 11,alignment: TextAlign.start),
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
}
