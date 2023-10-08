import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mea/constants.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    runZoned(
      () async {
        lockIc = Image.asset('assets/icon/ic_lock.png');
        mailIc = Image.asset('assets/icon/ic_mail.png');
        visibleIc = Image.asset('assets/icon/ic_visible.png');
      },
    );
    _hidePassword = true;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.instance.backgroundTheme),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 80,
            ),
            Text(
              'MEA',
              style: GoogleFonts.knewave(
                fontSize: 45,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(252, 252, 252, 1),
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Log In',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 45,
                fontWeight: FontWeight.w900,
                height: 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey[200]!),
                      ),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Username',
                        hintStyle: TextStyle(color: Colors.grey),
                        icon: mailIc,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey[200]!),
                      ),
                    ),
                    child: TextField(
                      obscureText: _hidePassword,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        icon: lockIc,
                        suffixIcon: IconButton(
                          icon: visibleIc,
                          onPressed: () {
                            setState(() {
                              _hidePassword = !_hidePassword;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 200),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(29, 254, 255, 254),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                          height: 0,
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
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: Color.fromARGB(168, 0, 187, 165),
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
