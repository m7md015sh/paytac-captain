import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';


late Position currentPosition;
Timer?timer;
StreamSubscription<Position>? positionStream;
late StreamSubscription<Position>homePageStreamSubscription;
class HomePageController extends GetxController{
  final loc.Location location = loc.Location();
  var currentUser=FirebaseAuth.instance.currentUser;
 late Position position;
  String driverStatusText='Offline Now';
  Color driverStatusColor=Colors.black;
  bool driverIsAvailable=false;


 //firebase

 var geoLocator=Geolocator();

 void locatePosition()async{
   LocationPermission permission;
   permission = await Geolocator.requestPermission();
   position=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);


  currentPosition=position;
  LatLng latLongPosition=LatLng(position.latitude,position.longitude);
  CameraPosition cameraPosition=CameraPosition(target: latLongPosition,zoom: 14);
  newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
   print('=========================${currentPosition.longitude}');

  update();
 }


Completer<GoogleMapController> controllerGoogleMap=Completer();
late GoogleMapController newGoogleMapController;

 final CameraPosition kGooglePlex=const CameraPosition(target: LatLng(31.41526,30.51554),zoom: 14.4746);


 void makeDriverOnlineNow()async{
   refreshLocation();
   update();
 }

 void makeDriverOffline(){

   positionStream?.cancel();

   positionStream = null;

   update();

  }
  requestPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      print('done');
    } else if (status.isDenied) {
      requestPermission();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }
refreshLocation()async{
   Future.delayed(Duration(seconds: 2));
  StreamSubscription<Position> positionStream=Geolocator.getPositionStream().listen((Position position) {
    print(position.longitude);
    print('=====================');
    print(position.longitude);
    timer=Timer.periodic(Duration(seconds: 2), (timer) {
      if(driverIsAvailable==true){
        FirebaseFirestore.instance.collection("location").doc("1").set({
          "lat":position.longitude,
          "long":position.longitude,
        });
      }else {
        makeDriverOffline();
        update();
      }
    });
  });

}
@override
  void onInit() {
  locatePosition();
  super.onInit();
  }
}