import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mea/widgets/custom_equipment_cell.dart';

import '../../services/department_api.dart';

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
  @override
  void initState() {
    super.initState();
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
      resizeToAvoidBottomInset: false,
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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.grey[100]),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Tên đơn yêu cầu thiết bị y tế:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Neumorphic(
                        style: NeumorphicStyle(
                          boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(20),
                          ),
                          depth: 6,
                          color: Colors.grey,
                          lightSource: LightSource.top,
                          intensity: 1,
                        ),
                        child: Card(
                          margin: const EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: Color.fromARGB(255, 226, 245, 253),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  controller: nameController,
                                  decoration: const InputDecoration.collapsed(
                                    hintText: 'Nhập tên đơn yêu cầu thiết bị',
                                  ),
                                  onChanged: (valueName) {
                                    setState(() {
                                      name = valueName;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Khoảng thời gian muốn nhận:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Neumorphic(
                        style: NeumorphicStyle(
                          boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(20),
                          ),
                          depth: 6,
                          color: Colors.grey,
                          lightSource: LightSource.top,
                          intensity: 1,
                        ),
                        child: Card(
                          margin: const EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: Color.fromARGB(255, 226, 245, 253),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Mô tả:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Neumorphic(
                        style: NeumorphicStyle(
                          boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(20),
                          ),
                          depth: 6,
                          color: Colors.grey,
                          lightSource: LightSource.top,
                          intensity: 1,
                        ),
                        child: Card(
                          margin: const EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: Color.fromARGB(255, 226, 245, 253),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  controller: descriptionController,
                                  maxLines: 8,
                                  decoration: const InputDecoration.collapsed(
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
                            if (nameError && descriptionError)
                              Text(
                                '*Tên và mô tả không được trống',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              )
                            else if (descriptionError)
                              Text(
                                '*Mô tả không được trống',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              )
                            else if (nameError)
                              Text(
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
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Center(
                  child: SizedBox(
                    width: size.width * 0.6,
                    height: 50,
                    child: Neumorphic(
                      style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(40),
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
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                        ),
                        onPressed: () async {
                          setState(() {
                            nameError = name.isEmpty;
                            descriptionError = description.isEmpty;
                          });

                          if (!nameError && !descriptionError) {
                            String convertedExpected =
                                convertDisplayToValue(expected);
                            await DepartmentServices.requestEquipment(
                              description: description,
                              name: name,
                              expected: convertedExpected,
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
              ),
            ],
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
