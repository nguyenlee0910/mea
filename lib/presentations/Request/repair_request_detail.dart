import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mea/presentations/Authencation/home.dart';
import 'package:mea/services/department_api.dart';

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
                height: 80,
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
                      color: const Color.fromARGB(255, 226, 245, 253),
                      margin: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      // color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 8, left: 18),
                                    child: Text(
                                      'Tên thiết bị:',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 4, left: 18),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(top: 8, left: 18),
                                    child: Text(
                                      'Mã thiết bị:',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 4, left: 18),
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextField(
                                      controller: fieldText,
                                      maxLines: 8, //or null
                                      decoration:
                                          const InputDecoration.collapsed(
                                        hintText: 'Nhập lý do bảo trì',
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          description = value;
                                        });
                                      },
                                    ),
                                    if (sendButtonPressed &&
                                        description.trim().isEmpty)
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: Text(
                                          '*Lý do không được để trống',
                                          style: TextStyle(
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                  ],
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
                                            'Bạn có chắc chắn gửi đơn ?',),
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
                                                  context, HomePage.routeName,);
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
            ],
          ),
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
