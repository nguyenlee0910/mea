import 'dart:core';

import 'dart:core';

class Utils {
  static String findDistance(String date) {
    final dateObject = DateTime.parse(date);
    final dateNow = DateTime.now();
    final duration = dateNow.difference(dateObject);

    if (duration.inMinutes < 1) {
      return 'Vừa xong';
    } else if (duration.inHours < 1) {
      return '${duration.inMinutes} phút trước';
    } else if (duration.inHours < 24) {
      return '${duration.inHours} giờ trước';
    } else {
      final distanceDate = duration.inDays;
      return '${distanceDate} ngày trước';
    }
  }
}
