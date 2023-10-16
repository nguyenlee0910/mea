import 'package:flutter/material.dart';

Widget buildEditable({
  String? titleText,
  required String initiaValue,
  required void Function(String) onChange,
  List<String> dropDownItems = const [],
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.end,
  Size size = const Size(240, 36),
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
              color: Colors.green,
              fontSize: 16,
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
        SizedBox(
          width: size.width,
          child: Container(
            width: double.infinity,
            height: size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadiusRatio),
              ),
              color: backgroundColor,
            ),
            child: dropDownItems.isNotEmpty
                ? Center(
                    child: DropdownButton<String>(
                      value: initiaValue,
                      onChanged: (String? value) {
                        onChange(value!);
                      },
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      isExpanded: true,
                      items:
                          dropDownItems.map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          alignment: Alignment.center,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Center(
                      child: TextFormField(
                        initialValue: initiaValue,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
          ),
        ),
      ],
    ),
  );
}
