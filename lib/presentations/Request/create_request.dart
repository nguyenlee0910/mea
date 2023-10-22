import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mea/constants.dart';
import 'package:mea/widgets/custom_textfield.dart';
import 'package:mea/widgets/equipment_cell.dart';
import 'package:mea/widgets/white_tableCell.dart';

class CreateRequest extends StatefulWidget {
  CreateRequest({super.key});
  static const routeName = 'create_request';

  final requestType = [
    'Loại đơn',
    'Đơn yêu cầu thiết bị',
    'Đơn yêu cầu sửa chữa',
  ];
  List<EquipmentCellData> equipmentCellData = [
    EquipmentCellData(name: 'Máy x quang', code: 'ABC'),
    EquipmentCellData(name: 'Máy đo huyết áp', code: 'AAA'),
    EquipmentCellData(name: 'name', code: 'code'),
    EquipmentCellData(name: 'name1', code: 'code1'),
    EquipmentCellData(name: 'name2', code: 'code2'),
    EquipmentCellData(name: 'abc', code: 'ASDAS'),
  ];

  @override
  State<CreateRequest> createState() => _CreateRequestState();
}

class _CreateRequestState extends State<CreateRequest> {
  late List<EquipmentCellData> filterCellData;
  late String choosenRequestType;
  @override
  void initState() {
    super.initState();
    choosenRequestType = widget.requestType.first;
    filterCellData = widget.equipmentCellData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: backBtn(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.backgroundTheme),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 80),
              child: WhiteTableCell(
                icon: Icons.edit_calendar,
                text: 'Lập đơn yêu cầu',
                isCenter: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                child: buildEditable(
                  size: const Size(352, 36),
                  backgroundColor: const Color.fromARGB(182, 255, 255, 255),
                  borderRadiusRatio: 50,
                  initiaValue: choosenRequestType,
                  mainAxisAlignment: MainAxisAlignment.center,
                  onChange: (value) {
                    setState(() {
                      choosenRequestType = value;
                    });
                  },
                  dropDownItems: widget.requestType,
                ),
              ),
            ),
            const SizedBox(
              height: 32,
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
                child: Padding(
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
                        filterCellData =
                            widget.equipmentCellData.where((element) {
                          return element.name.contains(value);
                        }).toList();
                      });
                    },
                  ),
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
