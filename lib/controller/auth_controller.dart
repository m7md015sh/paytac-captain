import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{

  static AuthController instance=Get.find();
  
  late Rx<User?>_user;
  FirebaseAuth auth=FirebaseAuth.instance;
  
  @override
  void onReady() {
    _user=Rx<User?>(auth.currentUser);
    //our user would be notified
    _user.bindStream(auth.userChanges());
    super.onReady();
  }

  _initialScreen(User?user){

  }
}