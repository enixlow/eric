import 'package:geolocator/geolocator.dart';

class UserManager {
  Geolocator geolocator = Geolocator();
  Position _currentPosition;

  getCurrentLocation() async{
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    print(geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best));
    _currentPosition = await geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    print("Latitude ${_currentPosition.latitude} Longtitude ${_currentPosition.longitude}");
    // return geolocator.getCurrentPosition(
        // desiredAccuracy: LocationAccuracy.best);
        
  }

  getDeviceLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
          _currentPosition = position;
          print("Latitude ${_currentPosition.latitude} Longtitude ${_currentPosition.longitude}");
        })
        .catchError((e) {
          print(e);
        });
  }

  getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);
      Placemark place = p[0];
      print("${place.locality}, ${place.postalCode}, ${place.country}");
    } catch (e) {
      print(e);
    }
  }
}
