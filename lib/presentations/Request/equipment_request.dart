import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mea/constants.dart';
import 'package:mea/widgets/custom_equipment_cell.dart';
import 'package:mea/widgets/equipment_cell.dart';
import 'package:mea/widgets/white_tableCell.dart';

class EquipmentRequestPage extends StatefulWidget {
  EquipmentRequestPage({super.key});
  static const routeName = 'equipment_request';

  List<CustomEquipmentCell> equipmentCellData = [
    CustomEquipmentCell(name: 'Găng tay'),
    CustomEquipmentCell(name: 'Găng tay2'),
    CustomEquipmentCell(name: 'Găng tay3'),
    CustomEquipmentCell(name: 'Găng tay4'),
    CustomEquipmentCell(name: 'Găng tay5'),
  ];

  @override
  State<EquipmentRequestPage> createState() => _EquipmentRequestPageState();
}

class _EquipmentRequestPageState extends State<EquipmentRequestPage> {
  late List<CustomEquipmentCell> filterCellData;

  @override
  void initState() {
    super.initState();
    filterCellData = widget.equipmentCellData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: backBtn(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.instance.backgroundTheme),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 80),
              child: WhiteTableCell(
                icon: Icons.edit_calendar,
                text: 'Đơn yêu cầu thiết bị',
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
              height: 40,
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
                    return CustomEquipmentCell(
                      name: filterCellData[index].name,
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
