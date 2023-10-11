import 'package:flutter/material.dart';
import 'package:mea/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String routeName = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.instance.backgroundTheme),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
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
                      size: 120.0,
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
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _buildCell(
                    icon: Icons.calendar_month,
                    text: 'Danh sách thiết bị trong phòng ban',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _buildCell(
                    icon: Icons.notifications,
                    text: 'Thông báo',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _buildCell(
                    icon: Icons.group,
                    text: 'Tin nhắn',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _buildCell(
                    icon: Icons.note_add,
                    text: 'Lập đơn',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _buildCell(
                    icon: Icons.art_track,
                    text: 'Theo dõi đơn',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCell({required IconData icon, required String text}) {
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
                    color: Color(0xFF6CD7CB),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
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
          print('hehe');
        },
      ),
    );
  }
}
