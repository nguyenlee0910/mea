import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class EquipmentCellData {
  EquipmentCellData({
    required this.name,
    required this.code,
    this.currentStatus,
    this.id,
  });
  String? id;
  String name;
  String code;
  String? currentStatus;
}

class EquipmentCell extends StatelessWidget {
  const EquipmentCell({
    required this.name,
    required this.code,
    this.currentStatus,
    this.buttonName = '',
    this.colorButtonName = Colors.grey, // Set a default color if needed
    this.onPress,
    super.key,
  });

  final String name;
  final String code;
  final String? currentStatus;
  final String buttonName;
  final VoidCallback? onPress;
  final Color colorButtonName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress?.call();
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Neumorphic(
            style: NeumorphicStyle(
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
              depth: 3,
              color: const Color.fromARGB(255, 255, 255, 255),
              intensity: 1,
            ),
            child: Container(
              width: 372,
              height: 128,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: ShapeDecoration(
                color: Color.fromARGB(255, 219, 236, 248),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 300,
                          height: 20,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Tên thiết bị: ',
                                  style: TextStyle(
                                    color: Color(0xFF1A1A1A),
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: name,
                                  style: const TextStyle(
                                    color: Color(0xFF1A1A1A),
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        SizedBox(
                          width: 300,
                          height: 20,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Mã thiết bị: ',
                                  style: TextStyle(
                                    color: Color(0xFF1A1A1A),
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  // text: '$code\n',
                                  text: '$code\n',
                                  style: const TextStyle(
                                    color: Color(0xFF1A1A1A),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Inter',
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        SizedBox(
                          width: 300,
                          height: 20,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Trạng thái: ',
                                  style: TextStyle(
                                    color: Color(0xFF1A1A1A),
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  // text: '$code\n',
                                  text: '$currentStatus\n',
                                  style: const TextStyle(
                                    color: Color(0xFF1A1A1A),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Inter',
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // const SizedBox(height: 4),
                        // SizedBox(
                        //   width: 300,
                        //   height: 20,
                        //   child: Text.rich(
                        //     TextSpan(
                        //       children: [
                        //         const TextSpan(
                        //           text: 'Trạng thái: ',
                        //           style: TextStyle(
                        //             color: Color(0xFF1A1A1A),
                        //             fontSize: 16,
                        //             fontFamily: 'Inter',
                        //             fontWeight: FontWeight.w600,
                        //             height: 0,
                        //           ),
                        //         ),
                        //         TextSpan(
                        //           text: '$currentStatus\n',
                        //           style: const TextStyle(
                        //             color: Color(0xFF1A1A1A),
                        //             fontSize: 16,
                        //             fontWeight: FontWeight.w400,
                        //             fontFamily: 'Inter',
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
