import 'dart:async';
import 'dart:convert';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mea/widgets/custom_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';
import '../../services/user_api.dart';

// ignore: must_be_immutable
class UserEditProfilePage extends StatefulWidget {
  UserEditProfilePage({super.key, required this.userModel});
  static const routeName = 'edit_profile';

  UserModel userModel;

  @override
  State<UserEditProfilePage> createState() => _UserEditProfilePageState();
}

class _UserEditProfilePageState extends State<UserEditProfilePage> {
  final genderList = ['Nam', 'Nữ'];

  String _gender = '';
  final String _role = '';
  final String _department = '';
  String _name = '';
  String _birthday = '';
  String _address = '';
  String departmentName = '';
  UserModel userModel = UserModel();
  String _email = '';
  String _phone = '';

  void getData() {
    setState(() {
      userModel = widget.userModel;
      _gender = userModel.gender ?? genderList.first;
      _name = userModel.name ?? 'NULL';
      _birthday = userModel.birthday ?? 'NULL';
      _address = userModel.address ?? 'NULL';
      _email = userModel.email ?? 'NULL';
      _phone = userModel.phone ?? 'NULL';
    });
    print('===>${userModel.gender}');
  }

  Future<void> _showGenderDialog() async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            // <-- SEE HERE
            title: const Text('Giới tính'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _gender = 'Nam';
                  });
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Nam',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _gender = 'Nữ';
                  });

                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Nữ',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    // DateTime dateTime = DateTime.parse(
    //     _birthday == 'NULL' ? DateTime.now().toIso8601String() : _birthday);]
    var dateTime = DateTime.now();
    try {
      dateTime = DateTime.parse(_birthday);
    } on Exception {
      print('ERROR');
      dateTime = DateTime.now();
    }
    final dateFormat = DateFormat('dd/MM/yyyy');
    var formattedDate = dateFormat.format(dateTime);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cập nhật thông tin cá nhân'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 110, 194, 247),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.grey[100]),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Center(
                  child: Container(
                    width: 140,
                    height: 140,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(),
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: ShapeDecoration(
                        image: const DecorationImage(
                          image: NetworkImage(
                            'https://i.pinimg.com/564x/ee/31/8c/ee318ca3da36bf34841e879c072aff25.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(74.87),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Neumorphic(
                  style: NeumorphicStyle(
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
                    depth: 5,
                    color: Colors.grey,
                    intensity: 1,
                  ),
                  child: Container(
                    width: size.width * 0.9,
                    height: size.height * 0.47,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          buildEditable(
                            widthscreen: size.width,
                            titleText: 'Tên:',
                            initiaValue: _name,
                            onChange: (value) {
                              setState(() {
                                _name = value;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          buildEditable(
                            widthscreen: size.width,
                            titleText: 'Email:',
                            initiaValue: _email,
                            onChange: (value) {
                              setState(() {
                                _email = value;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          buildEditable(
                            widthscreen: size.width,
                            titleText: 'SDT:',
                            initiaValue: _phone,
                            onChange: (value) {
                              setState(() {
                                _phone = value;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          buildEditable(
                            widthscreen: size.width,
                            titleText: 'Ngày sinh:',
                            initiaValue: _birthday,
                            isDatePicker: true,
                            context: context,
                            onChange: (value) {
                              setState(() {
                                _birthday = value;
                                print(_birthday);
                              });
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          buildEditable(
                            widthscreen: size.width,
                            titleText: 'Địa chỉ:',
                            initiaValue: _address,
                            onChange: (value) {
                              setState(() {
                                _address = value;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          // buildEditable(
                          //   titleText: 'Giới tính :',
                          //   initiaValue: _gender,
                          //   dropDownItems: genderList,
                          //   onChange: (value) {
                          //     setState(() {
                          //       _gender = value;
                          //     });
                          //   },
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Giới tính:',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              GestureDetector(
                                onTap: _showGenderDialog,
                                child: Container(
                                  height: 45,
                                  width: size.width * 0.57,
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    color: Color(0xffd9d9d9),
                                  ),
                                  child: Text(
                                    _gender,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Center(
                  child: Neumorphic(
                    style: NeumorphicStyle(
                      boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(40),
                      ),
                      depth: 5,
                      color: Colors.grey,
                      intensity: 1,
                    ),
                    child: SizedBox(
                      width: size.width * 0.6,
                      height: 56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 70, 113, 246),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                        ),
                        onPressed: () async {
                          print('===>>>>>>$_gender');
                          final updatedUser = UserModel(
                            name: _name,
                            email: _email,
                            phone: _phone,
                            birthday: _birthday,
                            address: _address,
                            gender: _gender,
                          );

                          await UserService.updateInformation(updatedUser)
                              .then((value) {
                            if (value == true) {
                              _showSucess(context, () {
                                context.pop();
                                context.pop(value);
                              });
                            }
                            // context.pop(value);
                          });
                        },
                        child: Text(
                          'Lưu',
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

void _showSucess(BuildContext context, VoidCallback? callback) {
  final alert = AlertDialog(
    title: const Text('Thành công'),
    content: const Text('Cập nhật thông tin thành công!'),
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
