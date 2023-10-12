import 'package:flutter/material.dart';
import 'package:mea/constants.dart';
import 'package:mea/models/cell_data.dart';

import '../../widgets/circle_avatar.dart';
import '../../widgets/white_tableCell.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({super.key});
  static String routeName = 'home_page';

  List<CellData> cellData = [
    CellData(
      iconData: Icons.calendar_month,
      textTitle: 'Danh sách thiết bị trong phòng ban',
    ),
    CellData(
      iconData: Icons.notifications,
      textTitle: 'Thông báo',
    ),
    CellData(
      iconData: Icons.group,
      textTitle: 'Tin nhắn',
    ),
    CellData(
      iconData: Icons.note_add,
      textTitle: 'Lập đơn',
    ),
    CellData(
      iconData: Icons.art_track,
      textTitle: 'Theo dõi đơn',
    ),
  ];

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
            const CircleAvatarWithName(),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: WhiteTableCell(
                    icon: widget.cellData[index].iconData!,
                    text: widget.cellData[index].textTitle!,
                  ),
                );
              },
              itemCount: widget.cellData.length,
            ),
          ],
        ),
      ),
    );
  }
}
