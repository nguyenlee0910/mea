import 'package:flutter/material.dart';

class CircleAvatarWithName extends StatelessWidget {
  CircleAvatarWithName({
    required this.name,
    this.deparmentName,
    this.email,
    super.key,
  });
  final String name;
  String? deparmentName;
  String? email;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 80, left: 44),
          child: Container(
            width: 135.61,
            height: 135.61,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(),
            child: const Icon(
              Icons.person_pin,
              color: Colors.white,
              size: 120,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 80, right: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w800,
                  height: 0,
                ),
              ),
              Text(
                deparmentName ?? "NULL",
                style: TextStyle(
                  color: Color(0xFF074E23),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              Text(
                email ?? "NULL",
                style: TextStyle(
                  color: Color(0xFF074E23),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
