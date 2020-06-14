library test_firebase_plugin;
// import 'package:meta/meta.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_firebase_plugin/device_manager.dart';
import 'package:test_firebase_plugin/firebase_manager.dart';
import 'package:test_firebase_plugin/test_callback.dart';
import 'package:test_firebase_plugin/user_manager.dart';
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
