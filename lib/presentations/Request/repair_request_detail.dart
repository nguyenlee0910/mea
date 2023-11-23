import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class RepairRequestDetail extends StatefulWidget {
  const RepairRequestDetail({
    required this.id,
    required this.codeEquipment,
    required this.nameEquipment,
    Key? key,
  }) : super(key: key);

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
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Tạo đơn sửa chữa thiết bị',
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
      resizeToAvoidBottomInset: false,
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
                height: 50,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Neumorphic(
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
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, left: 18),
                                child: Text(
                                  'Tên thiết bị:',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 4, left: 18),
                                child: Text(
                                  '${widget.nameEquipment}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, left: 18),
                                child: Text(
                                  'Mã thiết bị:',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 4, left: 18),
                                child: Text(
                                  '${widget.codeEquipment}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Divider(
                            color: Colors.grey,
                            thickness: 2,
                            indent: 20,
                            endIndent: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              left: 20,
                              right: 20,
                              bottom: 20,
                            ),
                            child: TextField(
                              controller: fieldText,
                              maxLines: 8, //or null
                              decoration: const InputDecoration.collapsed(
                                hintText: 'Lý do bảo trì',
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
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Center(
                  child: SizedBox(
                    width: size.width * 0.6,
                    height: 56,
                    child: Neumorphic(
                      style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(42),
                        ),
                        depth: 5,
                        color: Colors.transparent,
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
                        onPressed: () {
                          debugPrint(description);
                          // Handle your logic here
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
}
