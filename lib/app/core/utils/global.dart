import 'package:flutter/foundation.dart';

class Utils {

  static double toPrecision(double n, int precision) {
    return double.parse(n.toStringAsFixed(precision));
  }

  static void debugPrint(List<Object?> objects) {
    if(kDebugMode) {
      print("----------- DEBUG -----------");
      print(objects.first);
      for(var object in objects.skip(1)) {
        print("****************************");
        print(object);
      }
    }
  }

  static String parseMeterDistance(double n) {
    n = Utils.toPrecision(n, 0);
    return n >= 1000 ? "${Utils.toPrecision(n/1000, 1)} km" : "$n m";
  }

}