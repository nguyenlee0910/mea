import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mea/constants.dart';
import 'package:mea/models/equipment_model.dart';
import 'package:mea/presentations/Request/repair_request_detail.dart';
import 'package:mea/services/department_api.dart';
import 'package:mea/widgets/white_tableCell.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/equipment_cell.dart';

class RepairRequest extends StatefulWidget {
  const RepairRequest({super.key});
  static const routeName = 'repair_request';

  @override
  State<RepairRequest> createState() => _RepairRequestState();
}

class _RepairRequestState extends State<RepairRequest> {
  List<EquipmentCellData> filterCellData = [];
  List<EquipmentModel> equipmentList = [];
  List<EquipmentCellData> equipmentCellData = [];

  @override
  void initState() {
    super.initState();
    runZoned(() async {
      await SharedPreferences.getInstance().then(
        (value) async {
          final id = value.getString('departmentId');
          final resultArary = await Future.wait(
            [
              DepartmentServices.getEquipment(
                departmentId: id!,
              ),
              DepartmentServices.getEquipment(
                page: 1,
                departmentId: id,
              ),
            ],
          );
          final newList = List<EquipmentModel>.from(resultArary[0])
            ..addAll(resultArary[1])
            ..sort(
              (a, b) {
                final aStr = a.code.replaceAll(RegExp('[^0-9]'), '');
                final bStr = b.code.replaceAll(RegExp('[^0-9]'), '');
                return int.parse(aStr).compareTo(int.parse(bStr));
              },
            );
          // equipmentList = result;
          setState(() {
            if (newList.isNotEmpty) {
              final temp = <EquipmentCellData>[];
              for (final i in newList) {
                temp.add(
                    EquipmentCellData(name: i.name, code: i.code, id: i.id));
              }
              equipmentCellData = temp;
              filterCellData = equipmentCellData;
              print(filterCellData.length);
            }
          });
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: backBtn(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.backgroundTheme),
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 80),
              child: WhiteTableCell(
                icon: Icons.devices,
                text: 'Tạo đơn yêu cầu sửa chữa thiết bị',
                isCenter: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: SearchBar(
                hintText: 'Tìm kiếm',
                leading: const Icon(Icons.search),
                backgroundColor: MaterialStateProperty.all(
                  Colors.white.withOpacity(0.5),
                ),
                onChanged: (value) {
                  setState(() {
                    if (value.isEmpty) {
                      filterCellData = equipmentCellData;
                      return;
                    }
                    filterCellData = equipmentCellData.where((element) {
                      return element.name.contains(value);
                    }).toList();
                  });
                },
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return EquipmentCell(
                      name: filterCellData[index].name,
                      code: filterCellData[index].code,
                      buttonName: 'Yêu cầu sửa chữa thiết bị',
                      onPress: () {
                        context.push(
                            '/${RepairRequestDetail.routeName}/:${filterCellData[index].id}');
                      },
                    );
                  },
                  itemCount: filterCellData.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget backBtn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pop();
      },
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Center(
          child: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(168, 0, 187, 165),
          ),
        ),
      ),
    );
  }
}
