import 'package:flutter/material.dart';

import '../../constants.dart';

class UserEditProfilePage extends StatefulWidget {
  UserEditProfilePage({super.key});
  static const routeName = 'edit_profile';

  @override
  State<UserEditProfilePage> createState() => _UserEditProfilePageState();
}

class _UserEditProfilePageState extends State<UserEditProfilePage> {
  final genderList = ['Nam', 'Nữ'];
  final roleList = ['Nhân viên', 'Giám đốc'];
  final departmentList = ['Tim mạch', 'Sản phụ khoa'];

  String _gender = "";
  String _role = "";
  String _department = "";

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
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.instance.backgroundTheme),
        child: Column(
          children: [
            Center(
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
            Center(
              child: Container(
                width: size.width * 0.9,
                height: size.height * 0.45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(children: [
                    _buildEditable(
                      titleText: 'Tên:',
                      initiaValue: 'Hoang Thanh Thao',
                      onChange: (value) {},
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    _buildEditable(
                      titleText: 'Email:',
                      initiaValue: 'nguyenle@gmail.com',
                      onChange: (value) {},
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    _buildEditable(
                      titleText: 'SDT:',
                      initiaValue: '012345678',
                      onChange: (value) {},
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    _buildEditable(
                      titleText: 'CCCD:',
                      initiaValue: '1712200117270',
                      onChange: (value) {},
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    _buildEditable(
                      titleText: 'Giới tính:',
                      initiaValue: _gender,
                      dropDownItems: genderList,
                      onChange: (value) {
                        setState(() {
                          _gender = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    _buildEditable(
                      titleText: 'Chức vụ:',
                      initiaValue: _role,
                      dropDownItems: roleList,
                      onChange: (value) {
                        setState(() {
                          _role = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    _buildEditable(
                      titleText: 'Phòng ban:',
                      initiaValue: _department,
                      dropDownItems: departmentList,
                      onChange: (value) {
                        setState(() {
                          _department = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildEditable({
    required String titleText,
    required String initiaValue,
    required void Function(String) onChange,
    List<String> dropDownItems = const [],
  }) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            titleText,
            style: const TextStyle(
              color: Colors.green,
              fontSize: 16,
            ),
          ),
          Expanded(
            child: Container(),
          ),
          SizedBox(
            width: 240,
            child: Container(
              width: double.infinity,
              height: 36,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Color(0xffd9d9d9),
              ),
              child: dropDownItems.isNotEmpty
                  ? Center(
                      child: DropdownButton<String>(
                        value: initiaValue,
                        onChanged: (String? value) {
                          onChange(value!);
                        },
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        isExpanded: true,
                        items: dropDownItems
                            .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            alignment: Alignment.center,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Center(
                        child: TextFormField(
                          initialValue: initiaValue,
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
