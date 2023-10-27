import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mea/presentations/Authencation/create_new_password.dart';
import 'package:mea/services/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../../models/cell_data.dart';
import '../../models/user_model.dart';
import '../../widgets/circle_avatar.dart';
import '../../widgets/white_tableCell.dart';
import 'user_edit.dart';

// ignore: must_be_immutable
class UserManagementPage extends StatefulWidget {
  UserManagementPage({super.key});
  List<CellData> cellData = [
    CellData(
      iconData: Icons.group,
      textTitle: 'Cập nhật thông tin',
      route: '/${UserEditProfilePage.routeName}',
    ),
    CellData(
      iconData: Icons.lock,
      textTitle: 'Đổi mật khẩu',
      route: '/${CreateNewPassword.routeName}',
    ),
  ];

  @override
  State<UserManagementPage> createState() => _UserManagementPageState();
}

class _UserManagementPageState extends State<UserManagementPage> {
  UserModel userModel = UserModel();
  String departmentName = '';

  Future<void> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> data =
        jsonDecode(prefs.getString('userData')!) as Map<String, dynamic>;
    setState(() {
      userModel = UserModel.fromJson(data);
      departmentName = prefs.getString('departmentName') ?? "NULL";
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.grey[100]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatarWithName(
              name: userModel.name ?? "No Name",
              email: userModel.email,
              deparmentName: departmentName,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: WhiteTableCell(
                    icon: widget.cellData[index].iconData!,
                    text: widget.cellData[index].textTitle!,
                    route: widget.cellData[index].route ?? '',
                  ),
                );
              },
              itemCount: widget.cellData.length,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 64),
            //   child: Center(
            //     child: SizedBox(
            //       width: size.width * 0.6,
            //       height: 56,
            //       child: ElevatedButton(
            //         style: ElevatedButton.styleFrom(
            //           shape: RoundedRectangleBorder(
            //             side: BorderSide(
            //               width: 1,
            //               color: Color.fromARGB(255, 255, 87, 78),
            //             ),
            //             borderRadius: BorderRadius.all(Radius.circular(24)),
            //           ),
            //         ),
            //         onPressed: () {
            //           AuthService.logout(callBack: () {
            //             context.go('//');
            //           });
            //         },
            //         child: Text(
            //           'Đăng xuất',
            //           textAlign: TextAlign.center,
            //           style: GoogleFonts.inter(
            //             color: Color.fromARGB(255, 255, 87, 78),
            //             fontSize: 20,
            //             fontWeight: FontWeight.w800,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            GestureDetector(
              onTap: () {
                AuthService.logout(callBack: () {
                  context.go('//');
                });
              },
              child: Center(
                child: Neumorphic(
                  style: NeumorphicStyle(
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(24)),
                      depth: 7,
                      color: Colors.transparent,
                      intensity: 1),
                  child: Container(
                    width: 312,
                    height: 60,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 12),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 2,
                          color: Color.fromARGB(255, 255, 87, 78),
                        ),
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Đăng Xuất',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 87, 78),
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w800,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
