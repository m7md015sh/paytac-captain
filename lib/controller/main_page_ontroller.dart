import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paytac_captain/pages/earnings_page.dart';
import 'package:paytac_captain/pages/home_page.dart';
import 'package:paytac_captain/pages/profile_page.dart';
import 'package:paytac_captain/pages/rating_page.dart';

class MainPageController extends GetxController{


  int currentIndexNavBar=0;
  void changeIndexNavBar(int value){
    currentIndexNavBar=value;
    update();
  }

  List<Widget> widgetOptions=<Widget>[
     HomePage(),
    const EarningsPage(),
    const RatingPage(),
    const ProfilePage(),
  ];

}