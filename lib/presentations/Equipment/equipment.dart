import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:mea/constants.dart';

import '../../widgets/equipment_cell.dart';

class EquipmentPage extends StatefulWidget {
  EquipmentPage({super.key});
  static const routeName = 'equipment_all';

  List<EquipmentCellData> equipmentCellData = [
    EquipmentCellData(name: 'Máy x quang', code: 'ABC', quantity: 2),
    EquipmentCellData(name: 'Máy đo huyết áp', code: 'AAA', quantity: 2),
    EquipmentCellData(name: 'name', code: 'code', quantity: 3),
    EquipmentCellData(name: 'name1', code: 'code1', quantity: 1),
    EquipmentCellData(name: 'name2', code: 'code2', quantity: 2),
    EquipmentCellData(name: 'abc', code: 'ASDAS', quantity: 4),
  ];

  @override
  State<EquipmentPage> createState() => _EquipmentPageState();
}

class _EquipmentPageState extends State<EquipmentPage> {
  late List<EquipmentCellData> filterCellData;

  @override
  void initState() {
    super.initState();
    filterCellData = widget.equipmentCellData;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: backBtn(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.instance.backgroundTheme),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 80),
              child: Text(
                'Thiết bị trong phòng ban ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w800,
                  height: 0,
                ),
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
                      filterCellData = widget.equipmentCellData;
                      return;
                    }
                    filterCellData = widget.equipmentCellData.where((element) {
                      return element.name.contains(value);
                    }).toList();
                  });
                },
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: ShapeDecoration(
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
                      quantity: filterCellData[index].quantity,
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
