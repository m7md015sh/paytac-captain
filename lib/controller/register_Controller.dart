import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paytac_captain/pages/mainPage.dart';

class RegisterController extends GetxController{

  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
   var user;
    User? currentUser=FirebaseAuth.instance.currentUser;

  //final drivers=FirebaseDatabase.instance.ref();


  Future<dynamic> signUp(BuildContext context)async{
     user=  await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: emailController.text,password: passwordController.text).then((value) {

       if(currentUser!=null){
         FirebaseFirestore.instance.collection("users").doc(currentUser!.uid).set({
           "name":nameController.text,
           "email":emailController.text,
           "password":passwordController.text,
         });
         Navigator.of(context).push(MaterialPageRoute(
             builder: (context) =>
                 MainPage()));
       }


     }).catchError((e)=>print('auth===============error============== $e'));

    update();
  }



}