import 'package:flutter/cupertino.dart';

typedef OnCallBack = dynamic Function(dynamic random);
typedef OnSuccess = dynamic Function(String random);
typedef OnFailed = Function(int random);
typedef OnError = Function(int);


class TestCallback{
  String _baseUrl;
  Map<String, String> header = {"Content-Type": "application/json"};
  String test = '1';
  // OnCallBack _onCallBack;
  // OnSuccess _onSuccess;
  // OnFailed _onFailed;
  // OnError _onError;
  TestCallback(baseUrl);

   //Get Notification by id
  testingCallback(String notificationId,{ OnSuccess onSuccess, OnFailed onFailed, OnError onError}) async {
    int result = null;

    if(result == 200){
      onSuccess('hi');
    } else if(result == 404) {
      onFailed(1);
    } else if(result == null) {
      onError(123);
    }
  }
}
