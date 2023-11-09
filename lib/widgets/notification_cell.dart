import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:mea/utils/utils.dart';

class NotificationCellData {
  NotificationCellData(
      {required this.sender,
      required this.content,
      required this.iso8601Date,
      required this.title,
      required this.status,});
  String sender;
  String title;
  String content;
  String iso8601Date;
  String status;
}

class NotificationCell extends StatelessWidget {
  const NotificationCell({
    required this.sender,
    required this.content,
    required this.iso8601Date,
    required this.title,
    required this.status,
    this.onPress,
    super.key,
  });

  final String sender;
  final String title;
  final String content;
  final String iso8601Date;
  final String status;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    // DateTime dateTime = DateTime.parse(iso8601Date);
    // DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    // String formattedDate = dateFormat.format(dateTime);
    final (dateNoti, type) = Utils.findDistance(iso8601Date);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(0),
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
        child: GestureDetector(
          onTap: () {
            onPress!();
          },
          child: Neumorphic(
            style: NeumorphicStyle(
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                depth: 6,
                color: Colors.grey,
                intensity: 1,),
            child: Container(
              // width: 352,
              height: 120,
              padding: const EdgeInsets.all(16),
              decoration: ShapeDecoration(
                color: status == 'READ_DETAIL'
                    ? Colors.white
                    : const Color.fromARGB(255, 234, 242, 255),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Người thông báo: $sender',
                    style: const TextStyle(
                      color: Color(0xFF1A1A1A),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w800,
                      height: 0,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 300,
                          height: 20,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
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
                                  style: const TextStyle(
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
                          width: 300,
                          height: 20,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
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
                                  text: type == 'hours'
                                      ? '$dateNoti giờ trước\n'
                                      : '$dateNoti ngày trước\n',
                                  style: const TextStyle(
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
                        // const SizedBox(height: 8),
                        // SizedBox(
                        //   width: double.infinity,
                        //   height: 20,
                        //   child: Text.rich(
                        //     TextSpan(
                        //       children: [
                        //         TextSpan(
                        //           text: 'Nội dung: ',
                        //           style: TextStyle(
                        //             color: Color(0xFF999999),
                        //             fontSize: 16,
                        //             fontFamily: 'Inter',
                        //             fontWeight: FontWeight.w400,
                        //             height: 0,
                        //           ),
                        //         ),
                        //         TextSpan(
                        //           text: '$content\n',
                        //           style: TextStyle(
                        //             color: Color(0xFF1A1A1A),
                        //             fontSize: 16,
                        //             fontFamily: 'Inter',
                        //             fontWeight: FontWeight.w600,
                        //             height: 0,
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
