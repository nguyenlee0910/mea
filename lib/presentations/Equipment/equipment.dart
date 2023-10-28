import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';
import 'package:mea/constants.dart';
import 'package:mea/models/equipment_model.dart';
import 'package:mea/presentations/Equipment/equipiment_detail.dart';
import 'package:mea/services/department_api.dart';
import 'package:mea/widgets/white_tableCell.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/equipment_cell.dart';

class EquipmentPage extends StatefulWidget {
  const EquipmentPage({super.key});
  static const routeName = 'equipment_all';

  @override
  State<EquipmentPage> createState() => _EquipmentPageState();
}

class _EquipmentPageState extends State<EquipmentPage> {
  List<EquipmentCellData> filterCellData = [];
  List<EquipmentModel> equipmentList = [];
  List<EquipmentCellData> equipmentCellData = [];
  final TextEditingController _searchController = TextEditingController();

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
            ..addAll(resultArary[1]);
          equipmentList = newList;
          setState(() {
            if (newList.isNotEmpty) {
              final temp = <EquipmentCellData>[];
              for (final i in newList) {
                temp.add(EquipmentCellData(name: i.name, code: i.code));
              }
              equipmentCellData = temp;
              filterCellData = equipmentCellData;
            }
          });
          filterCellData.forEach((element) {
            print(element.name);
          });
        },
      );
    });
    _searchController.addListener(() {
      setState(() {
        if (_searchController.text.isEmpty) {
          filterCellData = equipmentCellData;
        }
        filterCellData = equipmentCellData.where((element) {
          return element.name.toLowerCase().contains(_searchController.text);
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Danh sách thiết bị'),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 12),
              child: Container(
                height: 50,
                child: TextField(
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.black),
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Tìm kiếm',
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () => _searchController.clear(),
                    ),
                    prefixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(width: 0.0)),
                  ),
                  onChanged: (value) {},
                ),
              ),
            )),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 110, 194, 247),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.grey[100]),
        child: Column(
          children: <Widget>[
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
                    print(filterCellData[index].name);
                    return EquipmentCell(
                      name: filterCellData[index].name,
                      code: filterCellData[index].code,
                      colorButtonName: Color.fromARGB(255, 70, 133, 246),
                      buttonName: 'Xem Chi tiết',
                      onPress: () {
                        context.push('/${EquipmentDetail.routeName}',
                            extra: equipmentList[index]);
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
      child: Neumorphic(
        style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            depth: 5,
            color: Colors.grey,
            intensity: 1),
        child: Container(
          width: 36,
          height: 36,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 2, color: Color(0xFFE5E5E5)),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
          child: const Center(
            child: Icon(
              Icons.arrow_back,
              color: Color(0xFFE5E5E5),
            ),
          ),
        ),
      ),
    );
  }
}
