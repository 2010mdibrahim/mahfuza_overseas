import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mahfuza_overseas/src/core/extensions/extensions.dart';

import '../../../../../../../main.dart';
import '../../../../core/routes/route_name.dart';
import '../../../../core/routes/router.dart';
import '../../../../core/utilities/assets_image.dart';
import '../../../../core/utilities/theme_config.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_textfield.dart';
import '../controller/login_controller.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder(
            init: LoginController(),
            builder: (controller) {
              return Scaffold(
                backgroundColor: ThemeConfig.white,

                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                          image: AssetImage("assets/background_image.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child:  Column(
                        children: [
                          20.ph,
                          Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                AssetImagePath.mahfuzaLogo,
                                height: 150,
                                width: 150,
                              )),
                          Expanded(
                            flex: 6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: CustomSimpleText(
                                        text: "Phone No./Employee ID*",
                                        fontSize: 20,
                                      ),
                                    ),
                                    2.ph,
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: CustomTextField(
                                        textInputType: TextInputType.number,
                                        controller:
                                            controller.emailTextFieldController,
                                        hint: "Enter employee id or email",
                                        // prefixIcon: Icon(Icons.lock),
                                        // obscureText: false,
                                        suffixIcon: const Icon(
                                          Icons.email,
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                10.ph,
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child:
                                          CustomSimpleText(text: "Password*"),
                                    ),
                                    2.ph,
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: CustomTextField(
                                        controller: controller
                                            .passwordTextFieldController,
                                        onChanged: (s) {
                                          controller.errorMessageHandling(s);
                                        },
                                        hint:
                                            "Enter your password",
                                        errorText: controller
                                                .errorMessage.value.isEmpty
                                            ? null
                                            : controller.errorMessage.value,
                                        // prefixIcon: const Icon(Icons.lock),
                                        obscureText:
                                            controller.passwordVisibility.value,
                                        suffixIcon: IconButton(
                                            onPressed: () => controller
                                                .passwordVisibilityFun(),
                                            icon: controller
                                                    .passwordVisibility.value
                                                ? const Icon(
                                                    Icons.visibility_off,
                                                    size: 25,
                                                  )
                                                : const Icon(
                                                    Icons.visibility,
                                                    size: 25,
                                                  )),
                                      ),
                                    ),
                                  ],
                                ),
                                // 10.ph,
                                // Align(
                                //   alignment: Alignment.centerRight,
                                //   child: Padding(
                                //     padding: const EdgeInsets.only(right: 10),
                                //     child: InkWell(
                                //       onTap: () {
                                //         RouteGenerator.pushNamed(
                                //             navigatorKey.currentContext!,
                                //             Routes.forgetPassword);
                                //       },
                                //       child: CustomSimpleText(
                                //         text: "Forgot your password?",
                                //         fontSize: 15,
                                //         color: ThemeConfig.primary,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                20.ph,
                                Center(
                                  child: controller.isLoading.value
                                      ? Center(
                                          child: CircularProgressIndicator(
                                              backgroundColor:
                                                  ThemeConfig.logoColor),
                                        )
                                      : CustomButton(
                                          title: 'Sign in',
                                          fontSize: 20,
                                          minimumHeight: 50.0,
                                          minimumWidth: 200.0,
                                          onPress: () async {
                                            controller.submitLoginData(context);
                                          },
                                          backgroundColor:
                                              ThemeConfig.logoColor,
                                        ),
                                ),
                                // 15.ph,
                                // Center(
                                //   child: RichText(
                                //     text: TextSpan(
                                //       children: [
                                //         const TextSpan(
                                //           text: "Don't have any account?",
                                //           style: TextStyle(color: Colors.black),
                                //         ),
                                //         TextSpan(
                                //           text: ' Sign up.',
                                //           style: const TextStyle(
                                //               color: Colors.blue),
                                //           recognizer: TapGestureRecognizer()
                                //             ..onTap = () {
                                //               RouteGenerator.pushNamed(
                                //                   context, Routes.signupScreen);
                                //             },
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
