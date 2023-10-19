import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mea/constants.dart';
import 'package:mea/models/cell_data.dart';
import 'package:mea/presentations/Equipment/equipiment_detail.dart';
import 'package:mea/presentations/Equipment/equipment.dart';
import 'package:mea/presentations/Request/equipment_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';
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
      route: '/${EquipmentPage.routeName}',
    ),
    // CellData(
    //   iconData: Icons.notifications,
    //   textTitle: 'Thông báo',
    // ),
    // CellData(
    //   iconData: Icons.group,
    //   textTitle: 'Tin nhắn',
    // ),
    CellData(
      iconData: Icons.note_add,
      textTitle: 'Lập đơn yêu cầu thiết bị',
      route: '/${EquipmentRequestPage.routeName}',
    ),
    CellData(
      iconData: Icons.note_add_outlined,
      textTitle: 'Lập đơn sửa chữa thiết bị',
      route: '/${EquipmentDetail.routeName}',
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
  UserModel userModel = UserModel();
  String departmentName = '';

  Future<void> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> data =
        jsonDecode(prefs.getString('userData')!) as Map<String, dynamic>;
    setState(() {
      userModel = UserModel.fromJson(data);
      departmentName = prefs.getString('departmentName') ?? "NULL";
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.instance.backgroundTheme),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatarWithName(
              name: userModel.name ?? 'No name',
              email: userModel.email,
              deparmentName: departmentName,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: WhiteTableCell(
                    icon: widget.cellData[index].iconData!,
                    text: widget.cellData[index].textTitle!,
                    route: widget.cellData[index].route ?? '',
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
