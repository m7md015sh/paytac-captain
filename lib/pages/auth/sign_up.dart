import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paytac_captain/controller/register_Controller.dart';
import 'package:paytac_captain/core/functions/alert_exit.dart';
import 'package:paytac_captain/core/functions/valied_input.dart';
import 'package:paytac_captain/pages/auth/login.dart';
import 'package:paytac_captain/pages/mainPage.dart';
import 'package:paytac_captain/utils/dimensions.dart';




import '../../widgets/auth/custom_body_text_auth.dart';
import '../../widgets/auth/custom_button_auth.dart';
import '../../widgets/auth/custom_text_form_auth.dart';
import '../../widgets/auth/custom_text_login_or_signup.dart';
import '../../widgets/auth/custom_title_text_auth.dart';

class SignupScreen extends StatelessWidget {
   SignupScreen({Key? key}) : super(key: key);
  //final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    //   Get.lazyPut(()=>SignUpControllerImp());
     final  controller  =Get.find<RegisterController>();
   // Get.put(RegisterController());
    final registerFormKey=GlobalKey<FormState>();


    return Scaffold(
        body:  WillPopScope(
                        onWillPop: alertExitApp,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: Dimensions.height30,
                              horizontal: Dimensions.height25),
                          child: Form(
                            key: registerFormKey,
                            child: ListView(
                              children: [
                                const CustomTitleTextAuth(text: "Sign Up"),
                                SizedBox(
                                  height: Dimensions.height35,
                                ),
                                const CustomBodyTextAuth(
                                  text:
                                      "Sign Up with Your Email and Password or continue with Social Media",
                                ),
                                SizedBox(
                                  height: Dimensions.height60,
                                ),
                                CustomTextFormAuth(
                                  isNumber: false,
                                  valid: (val) {
                                    return validInput(val!, 5, 80, "name");
                                  },
                                  myController:controller.nameController,
                                  hintText: "Enter Your First Name",
                                  labelText: "Name",
                                  prefixIcon: Icons.person,
                                ),
                                CustomTextFormAuth(
                                  isNumber: false,
                                  valid: (val) {
                                    return validInput(val!, 12, 30, "email");
                                  },
                                  myController: controller.emailController,
                                  hintText: "Enter Your Email",
                                  labelText: "Email",
                                  prefixIcon: Icons.email_outlined,
                                ),
                                CustomTextFormAuth(
                                  isNumber: false,
                                  valid: (val) {
                                    return validInput(val!, 12, 13, "phone");
                                  },
                                  myController: controller.phoneController,
                                  hintText: "Enter Your Phone",
                                  labelText: "Phone",
                                  prefixIcon: Icons.phone_android,
                                ),
                                CustomTextFormAuth(
                                  isNumber: false,
                                  valid: (val) {
                                    return validInput(val!, 8, 30, "password");
                                  },
                                 // obscure: controller.isPasswordSecure,
                                  onTapSuffixIcon: () {
                                  //  controller.changeSecurePassword();
                                  },
                                  myController:controller. passwordController,
                                  hintText: "Enter Your Password",
                                  labelText: "Password",
                                  prefixIcon: Icons.lock_outline,
                                  // suffixIcon:
                                  //     controller.isPasswordSecure == true
                                  //         ? Icons.remove_red_eye_outlined
                                  //         : Icons.remove_red_eye_rounded,
                                ),
                               CustomButtonAuth(
                                    text: "Sign Up",
                                    onPressed: () async {
                                      controller.signUp(context);


                                    }

                                  ),

                                SizedBox(
                                  height: Dimensions.height20,
                                ),
                                CustomTextSignUpOrSignIn(
                                    text: "Your have an account?",
                                    textBtn: "  Sign In",
                                    onTap: () {
                                      Get.to(LoginScreen());
                                    })
                              ],
                            ),
                          ),
                        )));
  }
}
