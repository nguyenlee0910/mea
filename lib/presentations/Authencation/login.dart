import 'dart:ffi';

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
  @override
  Widget build(BuildContext context) {
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
            )
          ],
        ),
      ),
    );
  }
}
