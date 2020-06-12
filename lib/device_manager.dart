import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:geolocator/geolocator.dart';
import 'global_instance.dart' as Global;

class DeviceManager {
  var geolocator = Geolocator()..forceAndroidLocationManager;
  var locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
  DeviceManager(){
    getDeviceInfo();
  }

  getDeviceInfo() async {
    if (Platform.isAndroid) {
      var androidInfo = await DeviceInfoPlugin().androidInfo;
      var release = androidInfo.version.release;
      var sdkInt = androidInfo.version.sdkInt;
      var manufacturer = androidInfo.manufacturer;
      var model = androidInfo.model;
      var version = androidInfo.version;
      var board = androidInfo.board;
      var bootloader = androidInfo.bootloader;
      var brand = androidInfo.brand;
      var device = androidInfo.device;
      var display = androidInfo.display;
      var fingerprint = androidInfo.fingerprint;
      var hardware = androidInfo.hardware;
      var host = androidInfo.host;
      var id = androidInfo.id;
      var product = androidInfo.product;
      var codename = androidInfo.version.codename;
      var incremental = androidInfo.version.incremental;
      var previewSdkInt = androidInfo.version.previewSdkInt;
      var securitypatch = androidInfo.version.securityPatch;
      var baseOs = androidInfo.version.baseOS;
      if(baseOs.isEmpty || baseOs == null) {
        baseOs = 'Android';
      }
      Global.deviceOS = baseOs;
      print('Global: ${Global.deviceOS}');
  }

    if (Platform.isIOS) {
      var iosInfo = await DeviceInfoPlugin().iosInfo;
      var systemName = iosInfo.systemName;
      var version = iosInfo.systemVersion;
      var name = iosInfo.name;
      var model = iosInfo.model;

      var sysname = iosInfo.utsname.sysname;
      print('$sysname $systemName $version, $name $model');
    }

    geolocator.checkGeolocationPermissionStatus().then((v) {
      if(v == GeolocationStatus.granted) {
        geolocator.getPositionStream(locationOptions).listen(
          (position) {
            print(position == null? 'No location detected' : position.latitude.toString()+ ', '+position.longitude.toString());
            
          }
        );
      }
    });
  }
}
