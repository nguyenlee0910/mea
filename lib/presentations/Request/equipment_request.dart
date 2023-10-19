import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mea/constants.dart';
import 'package:mea/widgets/custom_equipment_cell.dart';
import 'package:mea/widgets/white_tableCell.dart';

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
  DepartmentServices departmentServices = DepartmentServices();
  final fieldText = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: backBtn(context),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          width: double.infinity,
          decoration:
              BoxDecoration(gradient: AppColors.instance.backgroundTheme),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 80),
                child: WhiteTableCell(
                  icon: Icons.edit_calendar,
                  text: 'Đơn yêu cầu thiết bị',
                  isCenter: true,
                  route: '',
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: const Color(0xFF7CE6AD),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        controller: fieldText,
                        maxLines: 8, //or null
                        decoration: const InputDecoration.collapsed(
                          hintText: 'Nhập tên thiết bị bạn cần !!!',
                        ),
                        onChanged: (value) {
                          setState(() {
                            description = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Center(
                  child: SizedBox(
                    width: size.width * 0.6,
                    height: 56,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                      ),
                      onPressed: () async {
                        if (description.isNotEmpty) {
                          await departmentServices
                              .requestEquipment(description: description)
                              .then(
                            (value) {
                              if (value == true) {
                                _showSucess(context, () {
                                  context.pop();
                                  fieldText.clear();
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
                          color: const Color.fromARGB(168, 0, 187, 165),
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
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

void _showSucess(BuildContext context, VoidCallback? callback) {
  final alert = AlertDialog(
    title: const Text('Success'),
    content: const Text('Request Sucess !'),
    actions: [
      ElevatedButton(
          child: const Text('OK'),
          onPressed: () {
            callback!();
          },)
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
