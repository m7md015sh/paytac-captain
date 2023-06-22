import 'package:get/get.dart';
import 'package:paytac_captain/controller/home_page_controller.dart';


class HomePageBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(HomePageController());
  }

}