import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mea/widgets/custom_textfield.dart';

import '../../constants.dart';

class UserEditProfilePage extends StatefulWidget {
  const UserEditProfilePage({super.key});
  static const routeName = 'edit_profile';

  @override
  State<UserEditProfilePage> createState() => _UserEditProfilePageState();
}

class _UserEditProfilePageState extends State<UserEditProfilePage> {
  final genderList = ['Nam', 'Nữ'];
  final roleList = ['Nhân viên', 'Giám đốc'];
  final departmentList = ['Tim mạch', 'Sản phụ khoa'];

  String _gender = '';
  String _role = '';
  String _department = '';

  @override
  void initState() {
    super.initState();
    _gender = genderList.first;
    _role = roleList.first;
    _department = departmentList.first;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: backBtn(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.instance.backgroundTheme),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Center(
                child: Container(
                  width: 135.61,
                  height: 135.61,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Icon(
                    Icons.person_pin,
                    color: Colors.white,
                    size: 120,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: size.width * 0.9,
                height: size.height * 0.55,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(children: [
                    buildEditable(
                      titleText: 'Tên:',
                      initiaValue: 'Hoang Thanh Thao',
                      onChange: (value) {},
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    buildEditable(
                      titleText: 'Email:',
                      initiaValue: 'nguyenle@gmail.com',
                      onChange: (value) {},
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    buildEditable(
                      titleText: 'SDT:',
                      initiaValue: '012345678',
                      onChange: (value) {},
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    buildEditable(
                      titleText: 'CCCD:',
                      initiaValue: '1712200117270',
                      onChange: (value) {},
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    buildEditable(
                      titleText: 'Giới tính:',
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
                    buildEditable(
                      titleText: 'Chức vụ:',
                      initiaValue: _role,
                      dropDownItems: roleList,
                      onChange: (value) {
                        setState(() {
                          _role = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    buildEditable(
                      titleText: 'Phòng ban:',
                      initiaValue: _department,
                      dropDownItems: departmentList,
                      onChange: (value) {
                        setState(() {
                          _department = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],),
                ),
              ),
            )
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
