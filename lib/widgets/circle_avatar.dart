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
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 40, left: 44, right: 20, bottom: 20),
          child: Container(
            width: 140,
            height: 140,
            decoration: ShapeDecoration(
              image: const DecorationImage(
                image: NetworkImage(
                    'https://boxgaixinh.net/wp-content/uploads/2023/02/avatar-shin-cute-8.1.jpg',),
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(74.87),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 80, right: 60),
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
      ],
    );
  }
}
