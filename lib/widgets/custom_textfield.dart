import 'package:flutter/material.dart';

Widget buildEditable({
  required String initiaValue,
  required void Function(String) onChange,
  required double widthscreen,
  String? titleText,
  List<String> dropDownItems = const [],
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.end,
  double borderRadiusRatio = 10.0,
  Color backgroundColor = const Color(0xffd9d9d9),
}) {
  return SizedBox(
    child: Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        if (titleText != null) ...[
          Text(
            titleText,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
        SizedBox(
          width: widthscreen * 0.57,
          child: Container(
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadiusRatio),
              ),
              color: backgroundColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: TextFormField(
                    initialValue: initiaValue,
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
