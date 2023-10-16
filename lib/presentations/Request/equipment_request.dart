import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mea/constants.dart';
import 'package:mea/widgets/custom_equipment_cell.dart';
import 'package:mea/widgets/equipment_cell.dart';
import 'package:mea/widgets/white_tableCell.dart';

class EquipmentRequestPage extends StatefulWidget {
  EquipmentRequestPage({super.key});
  static const routeName = 'equipment_request';

  @override
  State<EquipmentRequestPage> createState() => _EquipmentRequestPageState();
}

class _EquipmentRequestPageState extends State<EquipmentRequestPage> {
  late List<CustomEquipmentCell> filterCellData;

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 80),
                child: WhiteTableCell(
                  icon: Icons.edit_calendar,
                  text: 'Đơn yêu cầu thiết bị',
                  isCenter: true,
                  route: '',
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Color(0xFF7CE6AD),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: TextField(
                        maxLines: 8, //or null
                        decoration: InputDecoration.collapsed(
                          hintText: "Nhập tên thiết bị bạn cần !!!",
                        ),
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
                      onPressed: () {},
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
