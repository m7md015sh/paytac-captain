import 'package:get/get.dart';

import '../controller/main_page_ontroller.dart';

class MainPageBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(MainPageController());
  }

}