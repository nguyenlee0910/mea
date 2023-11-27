import 'dart:async';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';
import 'package:mea/constants.dart';
import 'package:mea/models/equipment_model.dart';
import 'package:mea/presentations/Request/repair_request_detail.dart';
import 'package:mea/services/department_api.dart';
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
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    runZoned(() async {
      await SharedPreferences.getInstance().then(
        (value) async {
          final resultArary = await Future.wait(
            [
              DepartmentServices.getEquipment(),
              DepartmentServices.getEquipment(
                page: 1,
              ),
            ],
          );
          final newList = List<EquipmentModel>.from(resultArary[0])
              // ..addAll(resultArary[1])
              ;
          // ..sort(
          //   (a, b) {
          //     final aStr = a.code.replaceAll(RegExp('[^0-9]'), '');
          //     final bStr = b.code.replaceAll(RegExp('[^0-9]'), '');
          //     return int.parse(aStr).compareTo(int.parse(bStr));
          //   },
          // );
          // equipmentList = result;
          setState(() {
            if (newList.isNotEmpty) {
              final temp = <EquipmentCellData>[];
              for (final i in newList) {
                temp.add(
                  EquipmentCellData(
                    name: i.name ?? 'Trống',
                    code: i.code ?? 'Trống',
                    currentStatus: i.currentStatus ?? '',
                    id: i.id,
                  ),
                );
              }
              equipmentCellData = temp;
              filterCellData = equipmentCellData;
              print(filterCellData.length);
            }
          });
        },
      );
    });
    _searchController.addListener(() {
      setState(() {
        if (_searchController.text.isEmpty) {
          filterCellData = equipmentCellData;
          debugPrint(_searchController.text);
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
      key: repairRequestKey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Tạo đơn sửa chữa thiết bị',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 12),
            child: SizedBox(
              height: 50,
              child: TextField(
                textAlign: TextAlign.justify,
                style: const TextStyle(color: Colors.black),
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Tìm kiếm',
                  fillColor: Colors.white,
                  filled: true,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: _searchController.clear,
                  ),
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(width: 0),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 110, 194, 247),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.grey[100]),
        child: Column(
          children: <Widget>[
            // const Padding(
            //   padding: EdgeInsets.only(top: 80),
            //   child: WhiteTableCell(
            //     icon: Icons.devices,
            //     text: 'Tạo đơn yêu cầu sửa chữa thiết bị',
            //     isCenter: true,
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(12),
            //   child: Container(
            //     width: 352,
            //     height: 52,
            //     child: SearchBar(
            //       hintText: 'Tìm kiếm',
            //       leading: const Icon(Icons.search),
            //       backgroundColor: MaterialStateProperty.all(
            //         Colors.white.withOpacity(0.5),
            //       ),
            //       onChanged: (value) {
            //         setState(() {
            //           if (value.isEmpty) {
            //             filterCellData = equipmentCellData;
            //             return;
            //           }
            //           filterCellData = equipmentCellData.where((element) {
            //             return element.name.contains(value);
            //           }).toList();
            //         });
            //       },
            //     ),
            //   ),
            // ),
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
                child: filterCellData.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          print('This is url: ${filterCellData[0].imageUrl}');
                          return EquipmentCell(
                            // imageUrl:
                            //     'https://hips.hearstapps.com/hmg-prod/images/14bugatti-divo-99leadgallery-1535035005.jpg?crop=0.824xw:1.00xh;0.109xw,0&resize=768:*',
                            // imageUrl: filterCellData[index].imageUrl,

                            name: filterCellData[index].name,
                            code: filterCellData[index].code,
                            colorButtonName:
                                const Color.fromARGB(255, 70, 133, 246),
                            buttonName: 'Yêu cầu sửa chữa thiết bị',
                            onPress: () {
                              context.push(
                                '/${RepairRequestDetail.routeName}/${filterCellData[index].id}/${filterCellData[index].name}/${filterCellData[index].code}',
                              );
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
          intensity: 1,
        ),
        child: Container(
          width: 36,
          height: 36,
          decoration: const ShapeDecoration(
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
