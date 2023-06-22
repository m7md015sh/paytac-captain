// import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:location/location.dart' as loc;
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:paytac_captain/utils/map_style.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class MapController extends GetxController {
//   late GoogleMapController controller;
//
//   final loc.Location location = loc.Location();
//   StreamSubscription<loc.LocationData>? _locationSubscription;
//   var currentUser=FirebaseAuth.instance.currentUser;
//   final initialCameraPosition = const CameraPosition(
//     target: LatLng(30.0515328, 31.3688064),
//     zoom: 17.5,
//     tilt: 0.00, //The angle, in degrees, of the camera angle from the nadir
//     bearing:
//         60.00, //The camera's bearing in degrees, measured clockwise from north.
//   );
//
//   final Map<MarkerId, Marker> _markers = {};
//
//   Set<Marker> get markers => _markers.values.toSet();
//   final _markersController=StreamController<String>.broadcast();
//   Stream<String> get onMarkerTap =>_markersController.stream;
//
//   void onMapCreated(GoogleMapController controller) {
//     controller.setMapStyle(mapStyle);
//     controller=controller;
//   }
//
//   void onTap(LatLng position) {
//     final id =_markers.length.toString();
//     final markerId = MarkerId(_markers.length.toString());
//     final marker = Marker(
//       markerId: markerId,
//       position: position,
//       draggable: true,
//      // anchor: const Offset(1,0.5),
//       icon:BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure) ,
//       //rotation: -45,
//       onDragEnd: (newPosition){
//         print('new Position is: $newPosition');
//       },
//       onTap: (){
//         _markersController.sink.add(id);
//       }
//     );
//     _markers[markerId] = marker;
//     update();
//   }
//
//   getLocation() async {
//     try {
//       final loc.LocationData _locationResult = await location.getLocation();
//       await FirebaseDatabase.instance.ref('location').child(currentUser!.uid).set({
//         'latitude': _locationResult.latitude,
//         'longitude': _locationResult.longitude,
//         'name': currentUser!.email
//       }, );
//     } catch (e) {
//       print(e);
//     }
//     update();
//
//   }
//
//   Future<void> listenLocation() async {
//     _locationSubscription = location.onLocationChanged.handleError((onError) {
//       print(onError);
//       _locationSubscription?.cancel();
//
//         _locationSubscription = null;
//       update();
//
//     }).listen((loc.LocationData currentlocation) async {
//       await FirebaseDatabase.instance.ref('location').child(currentUser!.uid).set({
//         'latitude': currentlocation.latitude,
//         'longitude': currentlocation.longitude,
//         'name': currentUser!.email
//       });
//     });
//     update();
//
//   }
//
//   stopListening() {
//     _locationSubscription?.cancel();
//
//       _locationSubscription = null;
//      update();
//   }
//
//   requestPermission() async {
//     var status = await Permission.location.request();
//     if (status.isGranted) {
//       print('done');
//     } else if (status.isDenied) {
//       requestPermission();
//     } else if (status.isPermanentlyDenied) {
//       openAppSettings();
//     }
//   }
//
//   @override
//   void dispose() {
//     _markersController.close();
//     super.dispose();
//   }
//
// @override
//   void onInit() {
//   requestPermission();
//   location.changeSettings(interval: 300, accuracy: loc.LocationAccuracy.high);
//   location.enableBackgroundMode(enable: true);
//
//  //  FirebaseDatabase.instance.ref('location').onValue().listen((event){
//  //
//  //    event.docChanges.forEach((change){
//  //
//  //
//  //
//  //        markers.add(
//  //            Marker(
//  //                markerId: MarkerId(change.doc.id),
//  //                infoWindow: InfoWindow(
//  //                    title: change.doc.data()!['name'].toString()
//  //                ),
//  //                position: LatLng(change.doc.data()!['latitude'],change.doc.data()!['longitude'])
//  //            )
//  //
//  //        );
//  //
//  // update();
//  //
//  //    });
//  //
//  //  });
//
//     super.onInit();
//   }
// }
