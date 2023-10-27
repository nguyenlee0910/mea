import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
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
  const NotificationCell({
    required this.sender,
    required this.content,
    required this.iso8601Date,
    required this.title,
    super.key,
  });

  final String sender;
  final String title;
  final String content;
  final String iso8601Date;

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(iso8601Date);
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    String formattedDate = dateFormat.format(dateTime);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12),
        // child: Container(
        //   width: 358,
        //   height: 100,
        //   decoration: ShapeDecoration(
        //     gradient: const LinearGradient(
        //       begin: Alignment(0, -1),
        //       end: Alignment(0, 1),
        //       colors: [Color(0xFF7CE6AD), Color(0xFF7CE6D3)],
        //     ),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //   ),
        //   child: Padding(
        //     padding: const EdgeInsets.all(8),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text(
        //           'Tiêu đề: $title',
        //           style: const TextStyle(
        //             color: Color(0xFF3B6F69),
        //             fontSize: 18,
        //             fontFamily: 'Inter',
        //             fontWeight: FontWeight.w700,
        //             height: 0,
        //           ),
        //         ),
        //         Text(
        //           'Người gửi: $sender',
        //           style: const TextStyle(
        //             color: Color(0xFF3B6F69),
        //             fontSize: 18,
        //             fontFamily: 'Inter',
        //             fontWeight: FontWeight.w700,
        //             height: 0,
        //           ),
        //         ),
        //         Text(
        //           'Nội dung: $content',
        //           style: const TextStyle(
        //             color: Color(0xFF3B6F69),
        //             fontSize: 18,
        //             fontFamily: 'Inter',
        //             fontWeight: FontWeight.w700,
        //             height: 0,
        //           ),
        //         ),
        //         Text(
        //           'Thời gian tạo: $formattedDate',
        //           style: const TextStyle(
        //             color: Color(0xFF3B6F69),
        //             fontSize: 18,
        //             fontFamily: 'Inter',
        //             fontWeight: FontWeight.w700,
        //             height: 0,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        child: Neumorphic(
          style: NeumorphicStyle(
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
              depth: 6,
              color: Colors.grey,
              intensity: 1),
          child: Container(
            width: 352,
            height: 160,
            padding: const EdgeInsets.all(16),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Người thông báo: $sender',
                  style: TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w800,
                    height: 0,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  height: 73,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 193,
                        height: 19,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Tiêu đề: ',
                                style: TextStyle(
                                  color: Color(0xFF999999),
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '$title\n',
                                style: TextStyle(
                                  color: Color(0xFF1A1A1A),
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: 193,
                        height: 19,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Thời gian: ',
                                style: TextStyle(
                                  color: Color(0xFF999999),
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '$formattedDate\n',
                                style: TextStyle(
                                  color: Color(0xFF1A1A1A),
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        height: 19,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Nội dung: ',
                                style: TextStyle(
                                  color: Color(0xFF999999),
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '$content\n',
                                style: TextStyle(
                                  color: Color(0xFF1A1A1A),
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
