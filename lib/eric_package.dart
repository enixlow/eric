library eric_package;
// import 'package:meta/meta.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:eric_package/device_manager.dart';
import 'package:eric_package/firebase_manager.dart';
import 'package:eric_package/test_callback.dart';
import 'package:eric_package/user_manager.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:geolocator/geolocator.dart';

class EricPackage {
  UserManager _userManager;
  DeviceManager _deviceManager;
  FirebaseManager _firebaseManager;
  TestCallback _testCallback;
  EricPackage() {
    _userManager = UserManager();
    _deviceManager = DeviceManager();
    _firebaseManager = FirebaseManager(FirebaseMessaging());
    _testCallback = TestCallback('baseUrl');
  }

  Future<Position> getCurrentLocation() => _userManager.getCurrentLocation();
  getDeviceLocation() => _userManager.getDeviceLocation();
  getAddressFromLatLng() => _userManager.getAddressFromLatLng();

  getDeviceInfo() => _deviceManager.getDeviceInfo();

  requestNotificationPermission() => _firebaseManager.requestNotificationPermission();
  getToken() => _firebaseManager.getDeviceToken();
  configureFirebaseMessaging(Function fn) => _firebaseManager.configure(fn);

  callerTest(String notificationId, 
   {@required dynamic Function(String)onSuccess, @required Function(int)onFailed, @required Function(int)onError}
   ) => _testCallback.testingCallback(
     notificationId, 
     onSuccess: onSuccess, 
     onFailed: onFailed,
     onError: onError
     );
}
