import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paytac_captain/utils/routes_const.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child:ElevatedButton(onPressed: (){
        Get.offAllNamed(RoutesConst.login);
      }, child: Text('LOGOUT')),
    );
  }
}
