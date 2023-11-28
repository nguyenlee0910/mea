import 'dart:convert';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mea/presentations/Authencation/home.dart';
import 'package:mea/services/department_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';

class RepairRequestDetail extends StatefulWidget {
  const RepairRequestDetail({
    required this.id,
    required this.codeEquipment,
    required this.nameEquipment,
    super.key,
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
  bool isLoading = false;
  bool requestSuccess = false;
  bool sendButtonPressed = false;
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
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

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
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
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
                              padding: EdgeInsets.only(left: 20, top: 10),
                              child: Text(
                                'Người lập:',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 20, top: 5),
                              child: Text(
                                _name ?? 'Default Name',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20, top: 5),
                              child: Text(
                                'Phòng ban:',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 20, top: 5, bottom: 10),
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
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'Thông tin thiết bị:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.grey[100]),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Neumorphic(
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
                            color: const Color.fromARGB(255, 226, 245, 253),
                            margin: const EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            // color: Colors.white,
                            child: Container(
                              width: size.width - 30,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(top: 10, left: 20),
                                        child: Text(
                                          'Tên thiết bị:',
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, left: 20),
                                        child: Text(
                                          widget.nameEquipment,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(top: 10, left: 20),
                                        child: Text(
                                          'Mã thiết bị:',
                                          style: TextStyle(
                                            // color: Colors.black,
                                            fontSize: 17,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, left: 20, bottom: 10),
                                        child: Text(
                                          widget.codeEquipment,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'Lý do bảo trì:',
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
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              left: 20,
                              right: 20,
                              bottom: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  controller: fieldText,
                                  maxLines: 8, //or null
                                  decoration: const InputDecoration.collapsed(
                                    hintText: 'Nhập lý do bảo trì',
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
                        ],
                      ),
                    ),
                  ),
                ),
                if (sendButtonPressed && description.trim().isEmpty)
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                      top: 10,
                    ),
                    child: Text(
                      '*Lý do không được để trống',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 17,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: Center(
                  child: SizedBox(
                    width: size.width - 30,
                    height: 50,
                    child: Neumorphic(
                      style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(8),
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
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                        onPressed: isLoading
                            ? null
                            : () async {
                                // Check if description is not empty
                                if (description.trim().isEmpty) {
                                  // Show an error message
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('*Lý do không được để trống'),
                                    ),
                                  );

                                  // Set sendButtonPressed to true
                                  setState(() {
                                    sendButtonPressed = true;
                                  });
                                } else {
                                  // Show confirmation dialog
                                  final confirmed = await showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Xác nhận'),
                                        content: const Text(
                                          'Bạn có chắc chắn gửi đơn ?',
                                        ),
                                        actions: [
                                          // TextButton(
                                          //   onPressed: () {
                                          //     Navigator.of(context).pop(false);
                                          //   },
                                          //   child: const Text('Hủy'),
                                          // ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(true);
                                              Navigator.pushReplacementNamed(
                                                context,
                                                HomePage.routeName,
                                              );
                                            },
                                            child: const Text('Xác nhận'),
                                          ),
                                        ],
                                      );
                                    },
                                  );

                                  // If user confirms, make the API call
                                  if (confirmed == true) {
                                    await _makeApiCall();

                                    if (requestSuccess) {
                                      // Handle success
                                      debugPrint('API request successful!');
                                    } else {
                                      // Handle failure
                                      debugPrint('API request failed!');
                                    }
                                  }
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
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _makeApiCall() async {
    // Set isLoading to true to disable the button during API call
    setState(() {
      isLoading = true;
    });

    try {
      // Call the API
      final success = await DepartmentServices.requestRepairEquipment(
        description: description,
        endAt: '2023-11-24',
        note: 'your_note',
        price: NumberFormat.decimalPattern(),
        startAt: '2023-11-23',
        urlImage: ['yourUrlImageList', 'yourUrlImageList'],
        id: widget.id,
      );

      setState(() {
        requestSuccess = success;
      });

      // Optionally, show a success message to the user
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Tạo đơn thành công!')),
        );
      }
    } catch (error) {
      // Handle API call errors
      debugPrint('API request failed with error: $error');

      // Optionally, show an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('API request failed! Please try again.')),
      );
    } finally {
      // Reset isLoading to false after the API call is complete
      setState(() {
        isLoading = false;
      });
    }
  }
}
