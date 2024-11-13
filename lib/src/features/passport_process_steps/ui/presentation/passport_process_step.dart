import 'package:enhance_stepper/enhance_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mahfuza_overseas/src/core/extensions/extensions.dart';
import 'package:mahfuza_overseas/src/features/passport_process_steps/ui/controller/passport_process_step_controller.dart';

import '../../../../core/utilities/common_methods.dart';
class PassportProcessingStepsScreen extends StatefulWidget {
  final String candidateId;
  const PassportProcessingStepsScreen({super.key, required this.candidateId});

  @override
  State<PassportProcessingStepsScreen> createState() => _PassportProcessingStepsScreenState();
}

class _PassportProcessingStepsScreenState extends State<PassportProcessingStepsScreen> {


  @override
  Widget build(BuildContext context) {

    return GetBuilder(

      init: PassportProcessStepController(),
        initState: (passport){
          passport.controller?.passportProcessStepFunction(candidateId: widget.candidateId);
        },
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Passport Processing Steps", style: TextStyle(fontSize: 19),),
            leading: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios)),
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          body: controller.loading.value == true  ? const Center(child: CircularProgressIndicator(),) : EnhanceStepper(
            type: StepperType.vertical,
            currentStep: controller.currentStep.value,
            onStepContinue: (){
              controller.increament();
            },
            onStepCancel: (){
             controller.decreament();
            },
            onStepTapped: (step) => setState(() => controller.currentStep.value = step),
            steps: (controller.steps.isNotEmpty) ? controller.steps?.map((step) => EnhanceStep(
              title: Text(step.name),
              content: step.details?.stepName == null ? Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
                child: const Center(
                  child: Text("Process not complete yet!", textAlign: TextAlign.center , style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.white
                  ),),
                ),
              ) : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [
                      const Icon(Icons.check_circle_outline, color: Colors.green,),
                      10.pw,
                      RichText(
                        text: TextSpan(
                          text: '${step.details?.stepName}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black
                          ),
                          children: [
                            const TextSpan(
                              text: ' (Completed)',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green
                              ),
                            ),

                          ],
                        ),
                      )

                    ],
                  ),

                  10.ph,
                  Text(' ${DateFormat('EEEE,').format(step.details?.data ?? DateTime.now())} ${controller.addOrdinalIndicator(step.details?.data?.day ?? 0)} of ${DateFormat('MMMM yyyy').format(step.details?.data ?? DateTime.now())}'),
                ],
              ),
              isActive: step.details?.candidateName == null ? false : true,
            )).toList() ?? [] : [],
          )
        );
      }
    );
  }
}
