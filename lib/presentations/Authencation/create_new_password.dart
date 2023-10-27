import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
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
      appBar: AppBar(
        centerTitle: true,
        title: Text('Đổi mật khẩu'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 110, 194, 247),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.grey[100]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 80),
              child: Center(
                child: Text(
                  'MEA',
                  style: GoogleFonts.knewave(
                    fontSize: 45,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 70, 113, 246),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Neumorphic(
                    style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.only(
                                topRight: Radius.circular(42.5),
                                bottomRight: Radius.circular(42.5))),
                        depth: 5,
                        color: Colors.grey,
                        intensity: 1),
                    child: Container(
                      // width: double.infinity,
                      height: 52,
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 2, color: Color(0xFFE5E5E5)),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(42.5),
                            bottomRight: Radius.circular(42.5),
                          ),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Tạo mật khẩu mới',
                          style: TextStyle(
                            color: Color(0xFF1A1A1A),
                            fontSize: 25,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w900,
                            height: 0,
                          ),
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
                'Mật khẩu mới của bạn phải khác\nmật khẩu gần nhất đã sử dụng',
                style: TextStyle(
                  color: Color(0xFF999999),
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
                        hintText: 'Mật khẩu',
                        hintStyle: const TextStyle(
                          color: Color(0xFF999999),
                        ),
                        border: InputBorder.none,
                        icon: const Icon(
                          Icons.lock,
                          color: Color(0xFF999999),
                        ),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.remove_red_eye),
                          color: Color(0xFF999999),
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
                        hintText: 'Xác nhận mật khẩu',
                        hintStyle: const TextStyle(
                          color: Color(0xFF999999),
                        ),
                        border: InputBorder.none,
                        icon: const Icon(
                          Icons.lock,
                          color: Color(0xFF999999),
                        ),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.remove_red_eye),
                          color: Color(0xFF999999),
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
              child: Neumorphic(
                style: NeumorphicStyle(
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(40)),
                    depth: 5,
                    color: Colors.grey,
                    intensity: 1),
                child: SizedBox(
                  width: size.width * 0.6,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 70, 113, 246),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Lưu',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
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
      child: Neumorphic(
        style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            depth: 5,
            color: Colors.grey,
            intensity: 1),
        child: Container(
          width: 36,
          height: 36,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 2, color: Color(0xFFE5E5E5)),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
          child: const Center(
            child: Icon(
              Icons.arrow_back,
              color: Color(0xFFE5E5E5),
            ),
          ),
        ),
      ),
    );
  }
}
