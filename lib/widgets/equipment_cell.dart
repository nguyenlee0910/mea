import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class EquipmentCellData {
  EquipmentCellData({
    required this.name, required this.code, this.id,
  });
  String? id;
  String name;
  String code;
}

class EquipmentCell extends StatelessWidget {
  const EquipmentCell({
    required this.name,
    required this.code,
    required this.buttonName,
    required this.colorButtonName, this.onPress,
    super.key,
  });

  final String name;
  final String code;
  final String buttonName;
  final VoidCallback? onPress;
  final Color colorButtonName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12),
        // child: Container(
        //   width: 358,
        //   height: 86,
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
        //           'Tên thiết bị: $name',
        //           style: const TextStyle(
        //             color: Color(0xFF3B6F69),
        //             fontSize: 18,
        //             fontFamily: 'Inter',
        //             fontWeight: FontWeight.w700,
        //             height: 0,
        //           ),
        //         ),
        //         Text(
        //           'Mã thiết bị: $code',
        //           style: const TextStyle(
        //             color: Color(0xFF3B6F69),
        //             fontSize: 17,
        //             fontFamily: 'Inter',
        //             fontWeight: FontWeight.w500,
        //             height: 0,
        //           ),
        //         ),
        //         Center(
        //           child: Padding(
        //             padding: const EdgeInsets.only(top: 4),
        //             child: SizedBox(
        //               width: 200,
        //               height: 20,
        //               child: ElevatedButton(
        //                 style: ElevatedButton.styleFrom(
        //                   backgroundColor:
        //                       const Color.fromARGB(255, 255, 255, 255),
        //                   shape: const RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.all(Radius.circular(40)),
        //                   ),
        //                 ),
        //                 onPressed: () {
        //                   onPress!();
        //                 },
        //                 child: Text(
        //                   buttonName,
        //                   textAlign: TextAlign.center,
        //                   style: GoogleFonts.inter(
        //                     color: const Color.fromARGB(168, 0, 187, 165),
        //                     fontSize: 15,
        //                     fontWeight: FontWeight.w800,
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        child: Neumorphic(
          style: NeumorphicStyle(
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
              depth: 3,
              color: Colors.grey,
              intensity: 1,),
          child: Container(
            width: 372,
            height: 128,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: ShapeDecoration(
              color: Colors.white,
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
                                  color: Color(0xFF999999),
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: name,
                                style: const TextStyle(
                                  color: Color(0xFF1A1A1A),
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
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
                                  color: Color(0xFF999999),
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '$code\n',
                                style: const TextStyle(
                                  color: Color(0xFF1A1A1A),
                                  fontSize: 14,
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
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: () {
                    onPress!();
                  },
                  child: Neumorphic(
                    style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(12),),
                        depth: 5,
                        color: Colors.grey,
                        intensity: 1,),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12,),
                      decoration: ShapeDecoration(
                        // color: Color.fromARGB(255, 70, 133, 246),
                        color: colorButtonName,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            buttonName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w800,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
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
