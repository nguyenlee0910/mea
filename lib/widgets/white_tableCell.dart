import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WhiteTableCell extends StatelessWidget {
  const WhiteTableCell({
    required this.icon,
    required this.text,
    this.route,
    super.key,
  });

  final IconData icon;
  final String text;
  final String? route;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Container(
          // width: double.infinity,
          width: 352,
          height: 52,
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(42.5)),
            ),
          ),
          child: Center(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Icon(
                    icon,
                    size: 30,
                    color: const Color(0xFF6CD7CB),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Color(0xFF6CD7CB),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w900,
                      height: 0,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          if ('' != route) {
            context.pushReplacement(route!);
          }
        },
      ),
    );
  }
}
