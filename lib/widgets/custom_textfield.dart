import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';

Widget buildEditable(
    {required String initiaValue,
    required void Function(String) onChange,
    required double widthscreen,
    String? titleText,
    List<String> dropDownItems = const [],
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.end,
    double borderRadiusRatio = 10.0,
    Color backgroundColor = const Color(0xffd9d9d9),
    bool isDatePicker = false,
    BuildContext? context}) {
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
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: isDatePicker
                    ? GestureDetector(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            DateFormat('dd-MM-yyyy')
                                .format(DateTime.parse(initiaValue)),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context!,
                              initialDate: DateTime.parse(initiaValue),
                              firstDate: DateTime(1950),
                              //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime.now());

                          if (pickedDate != null) {
                            // final formattedDate =
                            //     DateFormat('dd-MM-yyyy').format(pickedDate);

                            onChange(pickedDate.toIso8601String());
                          } else {}
                        },
                      )
                    : TextFormField(
                        initialValue: initiaValue,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        onChanged: onChange,
                      ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}


// final selectedDate = await DatePicker.showDateTimePicker(
//                       context,
//                       showTitleActions: true,
//                       minTime: oneWeekAgo,
//                       maxTime: now,
//                       onChanged: (date) {
//                         print('change $date');
//                       },
//                       onConfirm: (date) {
//                         print('confirm $date');
//                         if (date.isAfter(now)) {
//                           // If the user chooses a time after the current time,
//                           // set the date time to the current time
//                           date = now;
//                         }
//                         // Handle the selected date time here
//                         setState(() {
//                           selectedDateTime = date;
//                         });
//                       },
//                       currentTime: now,
//                       locale: LocaleType.vi,
//                     );