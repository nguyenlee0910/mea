import 'dart:ffi';

import 'package:flutter/material.dart';

class EquipmentCellData {
  EquipmentCellData(
      {required this.name, required this.code, required this.quantity});
  String name;
  String code;
  int quantity;
}

class EquipmentCell extends StatelessWidget {
  const EquipmentCell(
      {required this.name,
      super.key,
      required this.code,
      required this.quantity});

  final String name;
  final String code;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          width: 358,
          height: 86,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [Color(0xFF7CE6AD), Color(0xFF7CE6D3)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tên thiết bị: ' + name,
                  style: TextStyle(
                    color: Color(0xFF3B6F69),
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                Text(
                  'Mã thiết bị: ' + code,
                  style: TextStyle(
                    color: Color(0xFF3B6F69),
                    fontSize: 17,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                Text(
                  'Số lượng: ' + quantity.toString(),
                  style: TextStyle(
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
