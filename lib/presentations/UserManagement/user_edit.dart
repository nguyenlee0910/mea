import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mea/widgets/custom_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../../models/user_model.dart';

class UserEditProfilePage extends StatefulWidget {
  const UserEditProfilePage({super.key});
  static const routeName = 'edit_profile';

  @override
  State<UserEditProfilePage> createState() => _UserEditProfilePageState();
}

class _UserEditProfilePageState extends State<UserEditProfilePage> {
  final genderList = ['Nam', 'Nữ'];

  String _gender = '';
  String _role = '';
  String _department = '';
  String _name = '';
  String _birthday = '';
  String _address = '';

  UserModel userModel = UserModel();
  String departmentName = '';

  Future<void> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> data =
        jsonDecode(prefs.getString('userData')!) as Map<String, dynamic>;
    setState(() {
      userModel = UserModel.fromJson(data);
      departmentName = prefs.getString('departmentName') ?? "NULL";
      _gender = userModel.gender == "MALE" ? genderList.first : genderList.last;

      _name = userModel.name ?? 'NULL';
      _birthday = userModel.birthday ?? 'NULL';
      _address = userModel.address ?? 'NULL';
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
    DateTime dateTime = DateTime.now();
    try {
      dateTime = DateTime.parse(_birthday);
    } on Exception {
      print('ERROR');
      dateTime = DateTime.now();
    }
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    String formattedDate = dateFormat.format(dateTime);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cập nhật thông tin cá nhân'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 110, 194, 247),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.grey[100]),
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
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://via.placeholder.com/140x140"),
                          fit: BoxFit.cover,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(74.87),
                        ),
                      ),
                    )),
              ),
            ),
            Center(
              child: Neumorphic(
                style: NeumorphicStyle(
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
                    depth: 5,
                    color: Colors.grey,
                    intensity: 1),
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
                          titleText: 'Tên:',
                          initiaValue: _name,
                          onChange: (value) {},
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        buildEditable(
                          titleText: 'Email:',
                          initiaValue: userModel.email ?? 'NULL',
                          onChange: (value) {},
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        buildEditable(
                          titleText: 'SDT:',
                          initiaValue: userModel.phone ?? 'NULL',
                          onChange: (value) {},
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        buildEditable(
                          titleText: 'Ngày sinh:',
                          initiaValue: formattedDate ?? 'NULL',
                          onChange: (value) {},
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        buildEditable(
                          titleText: 'Địa chỉ:',
                          initiaValue: userModel.address ?? 'NULL',
                          onChange: (value) {},
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        buildEditable(
                          titleText: 'Giới tính :',
                          initiaValue: _gender,
                          dropDownItems: genderList,
                          onChange: (value) {
                            setState(() {
                              _gender = value;
                            });
                          },
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
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Neumorphic(
                  style: NeumorphicStyle(
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(40)),
                      depth: 5,
                      color: Colors.grey,
                      intensity: 1),
                  child: SizedBox(
                    width: size.width * 0.6,
                    height: 56,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 70, 113, 246),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                      ),
                      onPressed: () {},
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
            intensity: 1),
        child: Container(
          width: 36,
          height: 36,
          decoration: ShapeDecoration(
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
