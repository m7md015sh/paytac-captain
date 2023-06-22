import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paytac_captain/controller/login_controller.dart';
import 'package:paytac_captain/core/functions/alert_exit.dart';
import 'package:paytac_captain/core/functions/valied_input.dart';
import 'package:paytac_captain/pages/mainPage.dart';
import 'package:paytac_captain/utils/colors.dart';
import 'package:paytac_captain/utils/dimensions.dart';
import 'package:paytac_captain/utils/routes_const.dart';

import 'package:paytac_captain/widgets/auth/custom_body_text_auth.dart';
import 'package:paytac_captain/widgets/auth/custom_button_auth.dart';
import 'package:paytac_captain/widgets/auth/custom_text_form_auth.dart';
import 'package:paytac_captain/widgets/auth/custom_text_login_or_signup.dart';
import 'package:paytac_captain/widgets/auth/custom_title_text_auth.dart';

import '../../../widgets/auth/logo_auth.dart';
import 'sign_up.dart';





class LoginScreen extends StatelessWidget {

  final loginFormKey=GlobalKey<FormState>();
   //final _auth = FirebaseAuth.instance;

  LoginScreen({Key? key}) : super(key: key);

 final controller=Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body:WillPopScope(onWillPop: alertExitApp, child: Container(
        padding: EdgeInsets.symmetric(
            vertical: Dimensions.width120, horizontal: Dimensions.height25),
        child: Form(
         // key: controller.loginFormKey,
          child: ListView(

            children: [
              CustomTitleTextAuth(text: "Login".tr),
              SizedBox(
                height: 30,
              ),
               LogoAuth(),
              SizedBox(
                height: Dimensions.height35,
              ),
              CustomTitleTextAuth(text: "Welcome Back".tr),
              SizedBox(
                height: Dimensions.height20,
              ),
              CustomBodyTextAuth(
                text:
                "Sign into your account".tr,
              ),
              SizedBox(
                height: Dimensions.height30,
              ),
              CustomTextFormAuth(
                isNumber: false,

                valid: (val){
                  return validInput(val!, 10 , 100, "email");
                },
                myController:controller.emailController,
                hintText: "Enter Your Email".tr,
                labelText: "Email".tr,
                prefixIcon: Icons.email_outlined,
              ),
              CustomTextFormAuth(
                isNumber: false,
               // obscure: controller.isPasswordSecure,
                onTapSuffixIcon: (){
               //   controller.changeSecurePassword();
                },
                valid: (val){
                  return validInput(val!, 8 , 30, "password");
                },
                myController:controller.passwordController,
                hintText: "Enter Your Password".tr,

                labelText: "Password".tr,

                prefixIcon: Icons.lock_outline,
               // suffixIcon: controller.isPasswordSecure==true?Icons.remove_red_eye_outlined:Icons.remove_red_eye_rounded,
              ),
              InkWell(
                onTap: (){
                 // controller.goToForget();
                },
                child:  Text(
                  "Forget Password".tr,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: Dimensions.font16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.grey,
                  ),
                ),
              ),
              CustomButtonAuth(
                text: "Login".tr,
                onPressed: () async{
                 await controller.logIn(context);
                 //  await _auth
                 //      .signInWithEmailAndPassword(email: emailController.text,password: passwordController.text);

                },
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              CustomTextSignUpOrSignIn(
                  text: "Don't have an account?".tr,
                  textBtn: " Sign Up".tr,
                  onTap: () {
                   Get.toNamed(RoutesConst.register);
                  })
            ],
          ),
        ),

      )));

  }
}
