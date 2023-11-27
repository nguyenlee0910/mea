import 'dart:async';

import 'package:flutter/material.dart';

class CircleAvatarWithName extends StatefulWidget {
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
  State<CircleAvatarWithName> createState() => _CircleAvatarWithNameState();
}

class _CircleAvatarWithNameState extends State<CircleAvatarWithName> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    runZoned(() async {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 30),
          child: Container(
            width: 100,
            height: 100,
            decoration: ShapeDecoration(
              image: const DecorationImage(
                image: NetworkImage(
                  'https://i.pinimg.com/564x/ee/31/8c/ee318ca3da36bf34841e879c072aff25.jpg',
                ),
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(74.87),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w800,
                    height: 0,
                  ),
                ),
                Text(
                  widget.deparmentName ?? 'NULL',
                  style: const TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                Text(
                  widget.email ?? 'NULL',
                  style: const TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
