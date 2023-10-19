
import 'package:flutter/material.dart';

class EquipmentCellData {
  EquipmentCellData({
    required this.name,
    required this.code,
  });
  String name;
  String code;
}

class EquipmentCell extends StatelessWidget {
  const EquipmentCell({
    required this.name,
    required this.code, super.key,
  });

  final String name;
  final String code;

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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
