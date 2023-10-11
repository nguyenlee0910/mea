import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mea/constants.dart';
import 'package:mea/presentations/Authencation/create_new_password.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});
  static String routeName = 'forgot_password';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButton: backBtn(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
        body: Container(
          width: double.infinity,
          decoration:
              BoxDecoration(gradient: AppColors.instance.backgroundTheme),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(80),
                child: Center(
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
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      // width: double.infinity,
                      height: 52,
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(42.5),
                              bottomRight: Radius.circular(42.5)),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Forgot password',
                          style: TextStyle(
                            color: Color(0xFF6CD7CB),
                            fontSize: 25,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w900,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 120),
                ],
              ),

              const Padding(
                padding: EdgeInsets.only(
                  top: 20,
                  left: 32,
                ),
                child: Text(
                  'Please enter your email code to\nrecover your password',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey[200]!),
                    ),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Username',
                      hintStyle: TextStyle(color: Colors.white),
                      icon: Icon(
                        Icons.mail,
                        color: Colors.white,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Center(
                child: SizedBox(
                  width: size.width * 0.6,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Send',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color: const Color.fromARGB(168, 0, 187, 165),
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: size.width * 0.4,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(29, 254, 255, 254),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    onPressed: () {
                      return context.go('/${CreateNewPassword.routeName}');
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
              //  Padding(
              //     padding: const EdgeInsets.only(top: 80),
              //     child: Text(
              //       'Forgot Password',
              //       style: GoogleFonts.inter(
              //         color: Colors.white,
              //         fontSize: 25,
              //         fontWeight: FontWeight.w900,
              //         height: 0,
              //       ),
              //     ),
              //   ),
            ],
          ),
        ));
  }

  Widget backBtn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go("\\");
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
