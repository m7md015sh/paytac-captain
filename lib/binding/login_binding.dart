import 'package:get/get.dart';
import 'package:paytac_captain/controller/login_controller.dart';
class LoginBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(LoginController());
  }

}