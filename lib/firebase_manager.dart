import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseManager {

  static final FirebaseManager _inst = FirebaseManager._internal();
  FirebaseManager._internal();
  factory FirebaseManager(FirebaseMessaging firebaseMessaging) {
    _inst.firebaseMessaging = firebaseMessaging;
    return _inst;
  }
  // FirebaseManager(this.firebaseMessaging);

  FirebaseMessaging firebaseMessaging;

  Future<String> getDeviceToken() async {
    String token = await firebaseMessaging.getToken();
    return token;
  }

  requestNotificationPermission() {
    firebaseMessaging.requestNotificationPermissions(const IosNotificationSettings(sound: true, badge: true, alert: true));
    firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
  }

  void configure(Function onPressedNotification) {
    String notificationId;
    print('IM inside configure');
    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        onPressedNotification(print('inside onmessage'));
      },
      onLaunch:  (Map<String, dynamic> message) async {
        print("onMessage: $message");
        onPressedNotification(print('inside onlaunch'));
      },
      onResume:  (Map<String, dynamic> message) async {
        print("onMessage: $message");
        onPressedNotification(print('inside onresume'));
      }
    );
  }
}