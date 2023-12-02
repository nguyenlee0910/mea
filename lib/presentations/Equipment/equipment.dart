import 'dart:async';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';
import 'package:mea/models/equipment_model.dart';
import 'package:mea/presentations/Equipment/equipiment_detail.dart';
import 'package:mea/services/department_api.dart';

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
      equipmentList = newList;
      setState(() {
        if (newList.isNotEmpty) {
          final temp = <EquipmentCellData>[];
          for (final i in newList) {
            temp.add(
              EquipmentCellData(
                imageUrl: (i.imageUrls?.isNotEmpty == true)
                    ? i.imageUrls![0]
                    : 'https://cdn.thuvienphapluat.vn/phap-luat/2022/202201/Tran/mua-ban-trang-thiet-bi-y-te-b-c-d.png',
                name: i.name ?? '',
                code: i.code ?? '',
                currentStatus: i.currentStatus ?? '',
                id: i.id ?? '',
              ),
            );
          }
          equipmentCellData = temp;
          filterCellData = equipmentCellData;
        }
      });
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
        title: const Text(
          'Thiết bị trong phòng ban',
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
      body: SizedBox(
        width: double.infinity,
        // decoration: BoxDecoration(color: Colors.grey[100]),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 10,
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
                          // print('Data return: ${filterCellData[index]}');
                          return EquipmentCell(
                            imageUrl: filterCellData[index].imageUrl,
                            name: filterCellData[index].name,
                            code: filterCellData[index].code,
                            currentStatus: filterCellData[index].currentStatus,
                            id: filterCellData[index].id,
                            onPress: () {
                              var idPush = filterCellData[index].id;
                              // List<dynamic> EquipmentModel(
                              //     List<dynamic> inputlist) {
                              //   List outputList = inputlist
                              //       .where((idPush) => idPush == equipmentList[index].id)
                              //       .toList();
                              //   return outputList;
                              // }
                              EquipmentModel company = equipmentList
                                  .where((element) => element.id == idPush)
                                  .first;

                              context.push(
                                '/${EquipmentDetail.routeName}',
                                // extra: equipmentList[index],
                                extra: company,
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
