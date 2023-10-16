// // restaurant.dart
// import 'package:freezed_annotation/freezed_annotation.dart';
// // import any other models we depend on
// import 'equipment_model.dart';

// part 'equipment_list.freezed.dart';
// part 'equipment_list.g.dart';

// @freezed
// class Restaurant with _$Restaurant {
//   factory Restaurant({
//     required String name,
//     required String cuisine,
//     // note: using a JsonKey to map our JSON key that uses
//     // *snake_case* to our Dart variable that uses *camelCase*
//     @JsonKey(name: 'year_opened') int? yearOpened,
//     // note: using an empty list as a default value
//     @Default([]) List<Review> reviews,
//   }) = _Restaurant;

//   factory Restaurant.fromJson(Map<String, dynamic> json) =>
//       _$RestaurantFromJson(json);
// }
