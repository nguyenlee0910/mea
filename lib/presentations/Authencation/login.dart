import 'dart:async';

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
        decoration: BoxDecoration(color: Colors.grey[100]),
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
                'Log In',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: const Color.fromARGB(255, 70, 113, 246),
                  fontSize: 45,
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
                          bottom: BorderSide(color: Colors.grey[200]!),
                        ),
                      ),
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Username',
                          hintStyle: TextStyle(
                            color: Color(0xFF999999),
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                          icon: Icon(
                            Icons.mail_outline,
                            color: Color(0xFF999999),
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
                          bottom: BorderSide(color: Colors.grey[200]!),
                        ),
                      ),
                      child: TextField(
                        obscureText: _hidePassword,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                            color: Color(0xFF999999),
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                          border: InputBorder.none,
                          icon: const Icon(
                            Icons.lock,
                            color: Color(0xFF999999),
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
                            'Remember me',
                            style: TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
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
                            backgroundColor:
                                const Color.fromARGB(29, 254, 255, 254),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          onPressed: () {
                            return context.go('/${ForgotPassword.routeName}');
                          },
                          child: Text(
                            'Forgot Password?',
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
                          backgroundColor: const Color.fromARGB(255, 70, 113, 246),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                        ),
                        onPressed: () {
                          AuthService.login(
                            userName: userName,
                            password: password,
                            callBack: () {
                              saveRemember(checkBoxValue);
                              context.go('/${Navigation.routeName}');
                            },
                          );
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
