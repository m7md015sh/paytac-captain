import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paytac_captain/binding/login_binding.dart';
import 'package:paytac_captain/binding/main_page_binding.dart';
import 'package:paytac_captain/binding/rsgister_binding.dart';
import 'package:paytac_captain/pages/auth/login.dart';
import 'package:paytac_captain/pages/auth/sign_up.dart';


import 'pages/mainPage.dart';
import 'utils/routes_const.dart';

class AppRoutes{
  //initialRoute
  //static const init= RoutesConst.language;

  //get Pages
  static final routes=[

   // GetPage(name: RoutesConst.init, page:()=>  MapScreen(),middlewares: [MyMiddleWare()]),
   // GetPage(name: RoutesConst.init, page:()=> const Language(),middlewares: [MyMiddleWare()] ),
   // GetPage(name: RoutesConst.init, page:()=>  HomeScreen(),middlewares: [MyMiddleWare()],bindings: [HomeBinding(),AuthBinding(),ProfileBinding()]),
    GetPage(name: RoutesConst.login, page:()=>  LoginScreen(),binding: LoginBinding()),
    GetPage(name: RoutesConst.home, page:()=>  MainPage(),bindings: [MainPageBinding()]),
    GetPage(name: RoutesConst.register, page:()=>  SignupScreen(),bindings: [RegisterBinding()]),


  ];
}
