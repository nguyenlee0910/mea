import 'package:flutter/material.dart';

class CircleAvatarWithName extends StatelessWidget {
  const CircleAvatarWithName({
    super.key,
  });

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
        const Padding(
          padding: EdgeInsets.only(top: 80, right: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hoang Nha Thy',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w800,
                  height: 0,
                ),
              ),
              Text(
                'Bộ phận: Tim mạch',
                style: TextStyle(
                  color: Color(0xFF074E23),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              Text(
                'nhathyxxxxxx@gmail.com',
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
