import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paytac_captain/controller/main_page_ontroller.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  final controller = Get.put(MainPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainPageController>(builder: (controller)=>controller.widgetOptions.elementAt(controller.currentIndexNavBar)),
      bottomNavigationBar: GetBuilder<MainPageController>(
        init: MainPageController(),
        builder: (controller) => BottomNavigationBar(
          items: const[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.credit_card),
              label: 'Earnings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Rating',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
            )
          ],
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.black,
          currentIndex: controller.currentIndexNavBar,
          onTap: (index) {
            controller.changeIndexNavBar(index);
          },
        ),
      ),
    );
  }
}
