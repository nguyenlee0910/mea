import 'dart:async';
import 'dart:convert';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';
import 'package:mea/constants.dart';
import 'package:mea/models/equipment_model.dart';
import 'package:mea/presentations/Request/repair_request_detail.dart';
import 'package:mea/services/department_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';
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
  UserModel userModel = UserModel();
  String _name = '';
  String departmentName = '';

  Future<void> getData() async {
    final prefs = await SharedPreferences.getInstance();
    final data =
        jsonDecode(prefs.getString('userData')!) as Map<String, dynamic>;
    setState(() {
      userModel = UserModel.fromJson(data);
      departmentName = prefs.getString('departmentName') ?? 'NULL';
      _name = userModel.name ?? 'NULL';
    });

    await runZoned(() async {
      await SharedPreferences.getInstance().then((value) async {
        final resultArray = await Future.wait([
          DepartmentServices.getEquipment(),
          DepartmentServices.getEquipment(page: 1),
        ]);

        final newList = List<EquipmentModel>.from(resultArray[0]);
        // Chỉ thêm các mục có currentStatus là 'ACTIVE'
        final activeList = newList
            .where((equipment) => equipment.currentStatus == 'ACTIVE')
            .toList();

        setState(() {
          if (activeList.isNotEmpty) {
            final temp = <EquipmentCellData>[];
            for (final i in activeList) {
              temp.add(
                EquipmentCellData(
                  name: i.name ?? 'Trống',
                  code: i.code ?? 'Trống',
                  currentStatus: i.currentStatus ?? '',
                  id: i.id,
                  imageUrl: i.imageUrls?.firstOrNull ?? '',
                ),
              );
            }
            equipmentCellData = temp;
            filterCellData = equipmentCellData;
            print(filterCellData.length);
          }
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getData();

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
                  contentPadding:
                      const EdgeInsets.only(top: 20, left: 10, right: 10),
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
            const SizedBox(
              height: 8,
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
                            name: filterCellData[index].name,
                            code: filterCellData[index].code,
                            imageUrl: filterCellData[index].imageUrl,
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
