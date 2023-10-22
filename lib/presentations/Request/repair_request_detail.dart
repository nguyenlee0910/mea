import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mea/constants.dart';
import 'package:mea/services/department_api.dart';
import 'package:mea/widgets/white_tableCell.dart';

class RepairRequestDetail extends StatefulWidget {
  const RepairRequestDetail({
    super.key,
    required this.id,
    required this.codeEquipment,
    required this.nameEquipment,
  });
  static const routeName = 'repair_request_detail';
  final String id;
  final String nameEquipment;
  final String codeEquipment;

  @override
  State<RepairRequestDetail> createState() => _RepairRequestDetailState();
}

class _RepairRequestDetailState extends State<RepairRequestDetail> {
  String description = '';
  final fieldText = TextEditingController();

  @override
  void initState() {
    super.initState();
    print(widget.id);
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
          decoration: BoxDecoration(gradient: AppColors.backgroundTheme),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 80),
                child: WhiteTableCell(
                  icon: Icons.edit_calendar,
                  text: 'Đơn yêu cầu sửa chữa thiết bị',
                  isCenter: true,
                  route: '',
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: const Color(0xFF7CE6AD),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Text(
                                'Tên thiết bị: ${widget.nameEquipment}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Text(
                                'Mã thiết bị: ${widget.codeEquipment}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Divider(
                          color: Colors.white,
                          thickness: 2,
                          indent: 8,
                          endIndent: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8, left: 20, right: 20, bottom: 20),
                          child: TextField(
                            controller: fieldText,
                            maxLines: 8, //or null
                            decoration: const InputDecoration.collapsed(
                              hintText: 'Lí do bảo trì',
                            ),
                            onChanged: (value) {
                              setState(() {
                                description = value;
                              });
                            },
                          ),
                        ),
                      ],
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
                        debugPrint(description);
                        await DepartmentServices.requestRepairEquipment(
                          id: widget.id,
                          description: description,
                        ).then((value) {
                          print(value);
                          if (value == true) {
                            _showSucess(context, () {
                              fieldText.clear();
                              context.pop();
                            });
                          }
                        });
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

  void _showSucess(BuildContext context, VoidCallback? callback) {
    final alert = AlertDialog(
      title: const Text('Success'),
      content: const Text('Request Sucess !'),
      actions: [
        ElevatedButton(
          child: const Text('OK'),
          onPressed: () {
            callback!();
          },
        )
      ],
    );
    // ignore: inference_failure_on_function_invocation
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
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
