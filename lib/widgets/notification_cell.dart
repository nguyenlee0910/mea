import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationCellData {
  NotificationCellData(
      {required this.sender,
      required this.content,
      required this.iso8601Date,
      required this.title});
  String sender;
  String title;
  String content;
  String iso8601Date;
}

class NotificationCell extends StatelessWidget {
  const NotificationCell(
      {super.key,
      required this.sender,
      required this.content,
      required this.iso8601Date,
      required this.title});

  final String sender;
  final String title;
  final String content;
  final String iso8601Date;

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(iso8601Date);
    DateFormat dateFormat = DateFormat('MM/dd/yyyy');
    String formattedDate = dateFormat.format(dateTime);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          width: 358,
          height: 120,
          decoration: ShapeDecoration(
            gradient: const LinearGradient(
              begin: Alignment(0, -1),
              end: Alignment(0, 1),
              colors: [Color(0xFF7CE6AD), Color(0xFF7CE6D3)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tiêu đề: $title',
                  style: const TextStyle(
                    color: Color(0xFF3B6F69),
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                Text(
                  'Người gửi: $sender',
                  style: const TextStyle(
                    color: Color(0xFF3B6F69),
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                Text(
                  'Nội dung: $content',
                  style: const TextStyle(
                    color: Color(0xFF3B6F69),
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                Text(
                  'Thời gian tạo: $formattedDate',
                  style: const TextStyle(
                    color: Color(0xFF3B6F69),
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
