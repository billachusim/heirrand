import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

/// Converts timeStamp from firebase
String timeConverter(Timestamp timestamp,
    {TimeConverterEnum time = TimeConverterEnum.Orders}) {
  String _date = '';

  if (time == TimeConverterEnum.Orders)
    _date = DateFormat('EEE. MMM dd, yyyy. kk:mm a').format(timestamp.toDate());

  return _date;
}

enum TimeConverterEnum {Orders}

/// get device height
double getDeviceHeight(BuildContext context) =>
    MediaQuery.of(context).size.height;

/// get device width
double getDeviceWidth(BuildContext context) =>
    MediaQuery.of(context).size.width;

class ImageLoader {
  static const String rootPaht = 'assets/icons/';

  static Image imageAsset(String icon) => Image.asset(rootPaht + icon);

  static Image imageNet(String url) => Image.network(url);

}

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

/// validate users email
bool isValidEmail(String email) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(email);
}


// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 926.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 428.0) * screenWidth;
}