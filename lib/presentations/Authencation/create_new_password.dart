import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mea/constants.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});
  static String routeName = 'create_new_password';

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  late bool _hidePassword = true;
  late bool _hideConfirmPassword = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _hidePassword = true;
    _hideConfirmPassword = true;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: backBtn(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.backgroundTheme),
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
                          bottomRight: Radius.circular(42.5),
                        ),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Create new password',
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
                const SizedBox(width: 120),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 32,
              ),
              child: Text(
                'Your new password must be different from\npreviously used password',
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
              child: Column(
                children: <Widget>[
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
                        icon: const Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
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
                      obscureText: _hideConfirmPassword,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        hintStyle: const TextStyle(color: Colors.white),
                        border: InputBorder.none,
                        icon: const Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.remove_red_eye),
                          color: Colors.white,
                          onPressed: () {
                            setState(() {
                              _hideConfirmPassword = !_hideConfirmPassword;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
                    'Save',
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
