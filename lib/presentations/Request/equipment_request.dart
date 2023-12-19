import 'dart:convert';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mea/models/user_model.dart';
import 'package:mea/viewModels/import_items_viewModels.dart';
import 'package:mea/widgets/custom_equipment_cell.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/department_api.dart';
import 'choose_supply_import_request.dart';

class EquipmentRequestPage extends StatefulWidget {
  const EquipmentRequestPage({super.key});
  static const routeName = 'equipment_request';

  @override
  State<EquipmentRequestPage> createState() => _EquipmentRequestPageState();
}

class _EquipmentRequestPageState extends State<EquipmentRequestPage> {
  late List<CustomEquipmentCell> filterCellData;
  String description = '';
  String name = '';
  String expected = '72 giờ';
  final descriptionController = TextEditingController();
  final nameController = TextEditingController();
  final expectedController = TextEditingController();
  bool nameError = false;
  bool descriptionError = false;
  UserModel userModel = UserModel();
  String _name = '';
  String departmentName = '';
  String chooseSupply = 'Chọn vật tư';
  final listImportRequestDevice = ListImportRequestDevice();

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final prefs = await SharedPreferences.getInstance();
    final data =
        jsonDecode(prefs.getString('userData')!) as Map<String, dynamic>;
    setState(() {
      userModel = UserModel.fromJson(data);
      departmentName = prefs.getString('departmentName') ?? 'NULL';
      _name = userModel.name ?? 'NULL';
    });
  }

  String convertDisplayToValue(String display) {
    switch (display) {
      case '1 giờ':
        return 'HOUR_1';
      case '3 giờ':
        return 'HOUR_3';
      case '5 giờ':
        return 'HOUR_5';
      case '24 giờ':
        return 'HOUR_24';
      case '36 giờ':
        return 'HOUR_36';
      case '72 giờ':
        return 'HOUR_72';
      default:
        return display;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Tạo đơn yêu cầu thiết bị',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 110, 194, 247),
          ),
        ),
      ),
      body: ListenableBuilder(
        listenable: listImportRequestDevice,
        builder: (context, child) => SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.grey[100]),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Thông tin người tạo:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Center(
                        child: Container(
                          width: size.width - 30,
                          child: Neumorphic(
                            style: NeumorphicStyle(
                              boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(8),
                              ),
                              depth: 3,
                              color: const Color.fromARGB(255, 226, 245, 253),
                              intensity: 1,
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 15, top: 10),
                                    child: Text(
                                      'Người lập:',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 15, top: 5),
                                    child: Text(
                                      _name ?? 'Default Name',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 15, top: 5),
                                    child: Text(
                                      'Phòng ban:',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 15, top: 5, bottom: 10),
                                    child: Text(
                                      departmentName ?? 'Default',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Chọn vật tư',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (listImportRequestDevice
                                    .data.isNotEmpty) ...[
                                  GestureDetector(
                                    child: const Text(
                                      'Chỉnh sửa',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    onTap: () {
                                      context.push(
                                          '/${ListSupplyPage.routeName}',
                                          extra: listImportRequestDevice);
                                    },
                                  ),
                                ],
                              ],
                            ),
                            const SizedBox(height: 6),
                            if (listImportRequestDevice.data.isEmpty) ...[
                              SizedBox(
                                width: size.width - 30,
                                height: 50,
                                child: Neumorphic(
                                  style: NeumorphicStyle(
                                    boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(8),
                                    ),
                                    depth: 6,
                                    color: Colors.grey,
                                    intensity: 1,
                                  ),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                        255,
                                        226,
                                        245,
                                        253,
                                      ),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      context.push(
                                          '/${ListSupplyPage.routeName}',
                                          extra: listImportRequestDevice);
                                    },
                                    child: Text(
                                      chooseSupply,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ] else ...[
                              SizedBox(
                                width: size.width,
                                child: DataTable(
                                  columnSpacing:
                                      20, // Điều chỉnh khoảng cách giữa các cột
                                  horizontalMargin:
                                      15, // Điều chỉnh khoảng cách giữa mép của bảng và các cột
                                  columns: const [
                                    DataColumn(
                                      label: Text(
                                        'Tên vật tư',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'SL',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                  rows: listImportRequestDevice.data
                                      .map(
                                        (element) => DataRow(
                                          cells: [
                                            DataCell(
                                              Text(
                                                element.name,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Text(
                                                element.quantityImport
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ],
                            const SizedBox(height: 15),
                            Container(
                              child: const Text(
                                'Khoảng thời gian muốn nhận:',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Neumorphic(
                              style: NeumorphicStyle(
                                boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(8),
                                ),
                                depth: 6,
                                color: Colors.grey,
                                lightSource: LightSource.top,
                                intensity: 1,
                              ),
                              child: Card(
                                margin: const EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                color: const Color.fromARGB(255, 226, 245, 253),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 2,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DropdownButton<String>(
                                        value: expected,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            expected = newValue!;
                                          });
                                        },
                                        items: <String>[
                                          '72 giờ',
                                          '1 giờ',
                                          '3 giờ',
                                          '5 giờ',
                                          '24 giờ',
                                          '36 giờ',
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              child: const Text(
                                'Mô tả:',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Neumorphic(
                              style: NeumorphicStyle(
                                boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(8),
                                ),
                                depth: 6,
                                color: Colors.grey,
                                lightSource: LightSource.top,
                                intensity: 1,
                              ),
                              child: Card(
                                margin: const EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                color: const Color.fromARGB(255, 226, 245, 253),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextField(
                                        controller: descriptionController,
                                        maxLines: 8,
                                        decoration:
                                            const InputDecoration.collapsed(
                                          hintText: 'Bông gạc, Bơm tiêm, ...',
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            description = value;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                children: [
                                  if (descriptionError)
                                    const Text(
                                      '*Mô tả không được trống',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    )
                                  else if (descriptionError)
                                    const Text(
                                      '*Mô tả không được trống',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    )
                                  else if (nameError)
                                    const Text(
                                      '*Tên không được trống',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 40, top: 40),
                          child: SizedBox(
                            width: size.width - 30,
                            height: 50,
                            child: Neumorphic(
                              style: NeumorphicStyle(
                                boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(8),
                                ),
                                depth: 6,
                                color: Colors.grey,
                                intensity: 1,
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 70, 133, 246),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                ),
                                onPressed: () async {
                                  setState(() {
                                    // nameError = name.isEmpty;
                                    descriptionError = description.isEmpty;
                                  });

                                  if (!descriptionError) {
                                    final convertedExpected =
                                        convertDisplayToValue(expected);
                                    await DepartmentServices.requestEquipment(
                                      description: description,
                                      expected: convertedExpected,
                                      listSupply: listImportRequestDevice
                                              .data.isEmpty
                                          ? <Map<String, dynamic>>[]
                                          : List<Map<String, dynamic>>.from(
                                              listImportRequestDevice.data
                                                  .map((e) {
                                                return {
                                                  'supplyId': e.supplyId,
                                                  'quantity': e.quantityImport,
                                                  'equipmentId': null,
                                                };
                                              }).toList(),
                                            ),
                                    ).then(
                                      (value) {
                                        if (value == true) {
                                          _showSucess(context, () {
                                            context.pop();
                                            descriptionController.clear();
                                            nameController.clear();
                                            context.pop();
                                          });
                                        }
                                      },
                                    );
                                  }
                                },
                                child: Text(
                                  'Gửi',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
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

void _showSucess(BuildContext context, VoidCallback? callback) {
  final alert = AlertDialog(
    title: const Text('Thành công'),
    content: const Text('Gửi đơn yêu cầu thiết bị y tế thành công!'),
    actions: [
      ElevatedButton(
        child: const Text('Xác nhận'),
        onPressed: () {
          callback!();
        },
      ),
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
