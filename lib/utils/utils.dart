import 'dart:core';


class Utils {
  static (int, String) findDistance(String date) {
    final dateObject = DateTime.parse(date);
    final dateNow = DateTime.now();
    final distance = dateNow.difference(dateObject).inHours;
    final distanceDate = distance / 24;
    if (distanceDate < 1) {
      return (distance, 'hours');
    }
    return (distanceDate.ceil(), 'days');
  }
}
