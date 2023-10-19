import 'package:flutter/material.dart';

class CustomEquipmentCell extends StatelessWidget {
  const CustomEquipmentCell({required this.name, super.key});

  final String name;
  @override
  Widget build(BuildContext context) {
    final texToShow = Text(
      name,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w900,
        height: 0,
      ),
      overflow: TextOverflow.clip,
    );
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          width: 352,
          height: 52,
          decoration: const ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(0, -1),
              end: Alignment(0, 1),
              colors: [Color(0xFF7CE6AD), Color(0xFF7CE6D3)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(42.5)),
            ),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: texToShow,
                ),
                IconButton(
                  onPressed: () {
                    print('object');
                  },
                  icon: const Icon(Icons.accessible_forward_sharp),
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
