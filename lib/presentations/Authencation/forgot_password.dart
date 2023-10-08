import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mea/constants.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});
  static String routeName = 'forgot_password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: BoxDecoration(gradient: AppColors.instance.backgroundTheme),
      child: Column(
        children: [
          Text(
            'MEA',
            style: GoogleFonts.knewave(
              fontSize: 45,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(252, 252, 252, 1),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ));
  }
}
