import 'package:flutter/material.dart';

export 'constants.dart';

const String login = 'Login';
const String mea = 'MEA';

class AppColors {
  static LinearGradient backgroundTheme = const LinearGradient(
    colors: [
      Color(0xff60e7c0),
      Color(0xff84f5a7),
      Color(0xff21d0eb),
      Color(0xff30d5e0),
      Color(0xff3cdcdc),
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );
}

const String kErrorString = 'NULL-RESPONSE';
GlobalKey<ScaffoldState> repairRequestKey = GlobalKey();

const String kAuthencatedRoleId = '2375e466-45d6-f1c2-9170-af1dcc2f5f6c';
