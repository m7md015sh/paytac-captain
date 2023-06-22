import 'package:get/get.dart';
import 'package:paytac_captain/controller/home_page_controller.dart';
import 'package:paytac_captain/controller/register_Controller.dart';


class RegisterBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(RegisterController());
  }

}