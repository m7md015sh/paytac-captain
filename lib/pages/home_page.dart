import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:paytac_captain/controller/home_page_controller.dart';

class HomePage extends StatelessWidget {
  final homeController=Get.put(HomePageController());

   HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetBuilder<HomePageController>(builder: (controller) => Stack(
      children: [
        GoogleMap(initialCameraPosition: homeController.kGooglePlex,
          myLocationButtonEnabled: false,
          mapType: MapType.normal,
          myLocationEnabled: true,
          zoomGesturesEnabled: true,
          zoomControlsEnabled: false,

          onMapCreated: (GoogleMapController controller){
            homeController.controllerGoogleMap.complete(controller);
            homeController.newGoogleMapController=controller;

            homeController.locatePosition();
          },
        ),
        //online offline driver container
       GetBuilder<HomePageController>(builder: (controller) {
         return  Container(
           height: 140,
           width: double.infinity,
           color: Colors.black54,
         );
       },),
        Padding(padding: EdgeInsets.symmetric(horizontal: 80.0,vertical: 55),
          child: MaterialButton(
            height: 55,

            onPressed: (){
              if(homeController.driverIsAvailable !=true){
                homeController.makeDriverOnlineNow();
                //homeController.listenLocation();
                //homeController.getLocationLiveUpdate();

                homeController.driverStatusColor=const Color(0xff0dac86);
                homeController.driverStatusText='Online Now';
                homeController.driverIsAvailable=true;
              }else{
                homeController.driverStatusColor=Colors.black;
                homeController.driverStatusText='Offline Now';
                homeController.driverIsAvailable=false;
                homeController.makeDriverOffline();
              }


            },
            color: homeController.driverStatusColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(homeController.driverStatusText,style: const TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold,color: Colors.white),),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.phone_android,color: Colors.white,size: 26,),
                ),
              ],
            ),
          ),

        )

      ],
    ),);
  }

}
