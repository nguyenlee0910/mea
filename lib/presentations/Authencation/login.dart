import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mea/navigation_page.dart';
import 'package:mea/presentations/Authencation/forgot_password.dart';
import 'package:mea/services/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'models/post.dart';
// import 'services/dummy_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String routeName = 'login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Widget lockIc;
  late Widget mailIc;
  late Widget visibleIc;
  late bool _hidePassword;
  late bool checkBoxValue;
  late SharedPreferences prefs;
  final dio = Dio();

  String userName = '';
  String password = '';
  String roleId = '';

  @override
  void initState() {
    super.initState();
    runZoned(
      () async {
        lockIc = Image.asset('assets/icon/ic_lock.png');
        mailIc = Image.asset('assets/icon/ic_mail.png');
        visibleIc = Image.asset('assets/icon/ic_visible.png');
        prefs = await SharedPreferences.getInstance();
      },
    );
    _hidePassword = true;
    checkBoxValue = true;
    userName = '';
    password = '';
  }

  void saveRemember(bool value) {
    unawaited(prefs.setBool('rememberMe', value));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(color: Color.fromARGB(255, 201, 229, 255)),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 80,
            ),
            Center(
              child: Text(
                'MEA',
                style: GoogleFonts.knewave(
                  fontSize: 45,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 70, 113, 246),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32, top: 40),
              child: Text(
                'Đăng nhập',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: const Color.fromARGB(255, 70, 113, 246),
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  height: 0,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: const Color.fromARGB(255, 0, 0, 0)!),
                        ),
                      ),
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Tên đăng nhập',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 95, 95, 95),
                            fontSize: 17,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                          icon: Icon(
                            Icons.mail_outline,
                            color: Color.fromARGB(255, 95, 95, 95),
                          ),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          setState(() {
                            userName = value;
                          });
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: const Color.fromARGB(255, 0, 0, 0)!),
                        ),
                      ),
                      child: TextField(
                        obscureText: _hidePassword,
                        decoration: InputDecoration(
                          hintText: 'Mật khẩu',
                          hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 95, 95, 95),
                            fontSize: 17,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                          border: InputBorder.none,
                          icon: const Icon(
                            Icons.lock,
                            color: Color.fromARGB(255, 95, 95, 95),
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.remove_red_eye,
                              color: Color(0xFF999999),
                            ),
                            color: Colors.white,
                            onPressed: () {
                              setState(() {
                                _hidePassword = !_hidePassword;
                              });
                            },
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                            value: checkBoxValue,
                            activeColor: Colors.blue,
                            onChanged: (newValue) {
                              setState(() {
                                checkBoxValue = newValue!;
                              });
                            },
                          ),
                          const Text(
                            'Lưu đăng nhập',
                            style: TextStyle(
                              color: Color.fromARGB(255, 95, 95, 95),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: size.width * 0.4,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 32, 69, 182),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          onPressed: () {
                            return context.go('/${ForgotPassword.routeName}');
                          },
                          child: Text(
                            'Quên mật khẩu?',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 88,
                    ),
                    SizedBox(
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
                        onPressed: () {
                          AuthService.login(
                              userName: userName,
                              password: password,
                              onSucess: () {
                                saveRemember(checkBoxValue);
                                context.go('/${Navigation.routeName}');
                              },
                              onFail: () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  borderSide: const BorderSide(
                                    color: Colors.green,
                                    width: 2,
                                  ),
                                  width: 280,
                                  buttonsBorderRadius: const BorderRadius.all(
                                    Radius.circular(2),
                                  ),
                                  dismissOnTouchOutside: true,
                                  dismissOnBackKeyPress: false,
                                  onDismissCallback: (type) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Dismissed by $type'),
                                      ),
                                    );
                                  },
                                  headerAnimationLoop: false,
                                  animType: AnimType.bottomSlide,
                                  title: 'ERROR',
                                  desc: 'Vui lòng kiểm tra tài khoản',
                                  showCloseIcon: false,
                                  btnCancelOnPress: () {},
                                  btnOkOnPress: () {},
                                ).show();
                              });
                        },
                        child: Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
