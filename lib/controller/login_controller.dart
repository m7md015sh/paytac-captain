import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paytac_captain/pages/mainPage.dart';
import 'package:paytac_captain/utils/routes_const.dart';

class LoginController extends GetxController{
  var user;
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  Future<dynamic> logIn(BuildContext context)async{
    user=  await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailController.text,password: passwordController.text).then((value) {
   
        Get.offAllNamed(RoutesConst.home);


    }).catchError((e)=>print(e));


    update();
  }
}