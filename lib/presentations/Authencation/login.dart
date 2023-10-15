import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mea/constants.dart';
import 'package:mea/navigation_page.dart';
import 'package:mea/presentations/Authencation/forgot_password.dart';

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
      },
    );
    _hidePassword = true;

    userName = '';
    password = '';
  }

  Future<void> login({
    required String userName,
    required String password,
    required VoidCallback callback,
  }) async {
    final body = {'password': password, 'username': userName};
    final response = await dio.post(
      'https://mea.monoinfinity.net/api/v1/auth/login',
      data: body,
    );
    debugPrint(response.toString());
    if (response.statusCode == 201) {
      callback();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.instance.backgroundTheme),
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
                  color: const Color.fromRGBO(252, 252, 252, 1),
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
                  color: Colors.white,
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
                        decoration: InputDecoration(
                          hintText: 'Username',
                          hintStyle: const TextStyle(color: Colors.white),
                          icon: mailIc,
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
                          hintStyle: const TextStyle(color: Colors.white),
                          border: InputBorder.none,
                          icon: lockIc,
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.remove_red_eye),
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
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                        ),
                        onPressed: () {
                          context.go('/${Navigation.routeName}');
                          // login(
                          //   userName: userName,
                          //   password: password,
                          //   callback: () {
                          //     context.go('/${Navigation.routeName}');
                          //   },
                          // );
                          ;
                        },
                        child: Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            color: const Color.fromARGB(168, 0, 187, 165),
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
