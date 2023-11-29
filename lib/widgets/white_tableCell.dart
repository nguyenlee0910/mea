import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';

class WhiteTableCell extends StatelessWidget {
  const WhiteTableCell(
      {required this.icon,
      required this.text,
      this.route,
      this.isCenter = false,
      super.key,
      this.extra});

  final IconData icon;
  final String text;
  final String? route;
  final bool isCenter;
  final dynamic extra;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final texToShow = Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Color(0xFF1A1A1A),
        fontSize: 14,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w800,
        height: 0,
      ),
      overflow: TextOverflow.clip,
    );
    return Center(
      child: Neumorphic(
        style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(42)),
          depth: 5,
          color: Colors.grey,
          intensity: 1,
        ),
        child: GestureDetector(
          child: Container(
            // width: double.infinity,
            width: size.width - 40,
            height: 52,
            decoration: const ShapeDecoration(
              color: Color.fromARGB(255, 205, 229, 245),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(42)),
              ),
            ),
            child: Center(
              child: Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 24, right: isCenter ? 0 : 24),
                    child: Icon(
                      icon,
                      size: 30,
                      color: const Color(0xFF1A1A1A),
                    ),
                  ),
                  if (isCenter)
                    Expanded(child: texToShow)
                  else
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: texToShow,
                    ),
                  SizedBox(
                    width: isCenter ? 36 : 0,
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            if ('' != route && extra == null) {
              context.push(route!);
            } else if ('' != route && extra != null) {
              context.push(route!, extra: extra);
            }
          },
        ),
      ),
    );
  }
}
