import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:paytac_captain/pages/home_page.dart';

import 'routes_manager.dart';
import 'utils/routes_const.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: FirebaseAuth.instance.currentUser?.uid !=null?RoutesConst.home: RoutesConst.login,
      //initialRoute:RoutesConst.login,
      getPages:AppRoutes.routes,
    ));
  });


  // runApp( MaterialApp(home: HomePage()));
}
