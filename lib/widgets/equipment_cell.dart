import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EquipmentCellData {
  EquipmentCellData({
    this.id,
    required this.name,
    required this.code,
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
    this.onPress,
    super.key,
  });

  final String name;
  final String code;
  final String buttonName;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          width: 358,
          height: 86,
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
                  'Tên thiết bị: $name',
                  style: const TextStyle(
                    color: Color(0xFF3B6F69),
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                Text(
                  'Mã thiết bị: $code',
                  style: const TextStyle(
                    color: Color(0xFF3B6F69),
                    fontSize: 17,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: SizedBox(
                      width: 200,
                      height: 20,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                        ),
                        onPressed: () {
                          onPress!();
                        },
                        child: Text(
                          buttonName,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            color: const Color.fromARGB(168, 0, 187, 165),
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
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
