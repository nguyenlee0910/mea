import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mea/models/cell_data.dart';
import 'package:mea/presentations/Equipment/equipment.dart';
import 'package:mea/presentations/Request/equipment_request.dart';
import 'package:mea/presentations/Request/list_equipment_ticket.dart';
import 'package:mea/presentations/Request/list_repair_ticket.dart';
import 'package:mea/presentations/Request/repair_request.dart';
import 'package:mea/presentations/Request/view_request.dart';
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
      iconData: Icons.medical_services_rounded,
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
      iconData: Icons.warehouse_rounded,
      textTitle: 'Tạo đơn yêu cầu thiết bị',
      route: '/${EquipmentRequestPage.routeName}',
    ),
    CellData(
      iconData: Icons.article_rounded,
      textTitle: 'Tạo đơn sửa chữa thiết bị',
      route: '/${RepairRequest.routeName}',
    ),
    CellData(
      iconData: Icons.list_alt_rounded,
      textTitle: 'Đơn yêu cầu thiết bị y tế',
      route: '/${ListEquipmentTicket.routeName}',
    ),
    CellData(
      iconData: Icons.edit_calendar_rounded,
      textTitle: 'Đơn yêu cầu sửa chữa',
      route: '/${ListRepairTicket.routeName}',
    ),
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModel userModel = UserModel();
  String departmentName = '';

  Future<void> getData() async {
    final prefs = await SharedPreferences.getInstance();
    final data =
        jsonDecode(prefs.getString('userData')!) as Map<String, dynamic>;
    setState(() {
      userModel = UserModel.fromJson(data);
      departmentName = prefs.getString('departmentName') ?? 'NULL';
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
        decoration: BoxDecoration(color: Colors.grey[100]),
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
                  child: Container(
                    child: WhiteTableCell(
                      icon: widget.cellData[index].iconData!,
                      text: widget.cellData[index].textTitle!,
                      route: widget.cellData[index].route ?? '',
                    ),
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
