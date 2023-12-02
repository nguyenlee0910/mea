import 'package:flutter/material.dart';

// ignore: strict_raw_type
ScaffoldFeatureController showSnackBarErrorMessage({
  required BuildContext context,
  required String message,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    ),
  );
}
