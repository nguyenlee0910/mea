import 'dart:core';

import 'package:intl/intl.dart';

class Utils {
  static (int, String) findDistance(String date) {
    var dateObject = DateTime.parse(date);
    var dateNow = DateTime.now();
    var distance = dateNow.difference(dateObject).inHours;
    var distanceDate = distance / 24;
    if (distanceDate < 1) {
      return (distance, 'hours');
    }
    return (distanceDate.ceil(), 'days');
  }
}
