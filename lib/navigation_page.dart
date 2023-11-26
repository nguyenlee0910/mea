import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mea/presentations/Authencation/home.dart';
import 'package:mea/presentations/Message/stream-chat.dart';
import 'package:mea/presentations/Notification/list_notification.dart';
import 'package:mea/presentations/UserManagement/user_management.dart';
import 'package:mea/services/firebase_service.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});
  static const routeName = 'navigation_page';

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  int _badgeCount = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    const NotificationPage(),
    // MyApp(client, user),
    const MessagePage(),
    UserManagementPage(),
  ];

  @override
  void initState() {
    super.initState();
    runZoned(
      () async {
        await FireBaseService().initNotificaitonService(
          badgeCountListener: (badgeCount) {
            setState(() {
              if (badgeCount != 0) {
                _badgeCount = badgeCount;
              }
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBarName = <String>[
      'Trang chủ',
      'Thông báo',
      'Tin nhắn',
      'Thông tin cá nhân',
    ];
    return Scaffold(
      appBar: _selectedIndex == 4
          ? null
          : AppBar(
              centerTitle: true,
              title: Text(
                appBarName[_selectedIndex],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 110, 194, 247),
                ),
              ),
            ),
      body: _widgetOptions.elementAt(_selectedIndex),
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        // borderRadius: const BorderRadius.only(
        //   topRight: Radius.circular(20),
        //   topLeft: Radius.circular(20),
        // ),
        child: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.blue[900],
          selectedIconTheme: IconThemeData(color: Colors.blue[900]),
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                //  color: Colors.white,
              ),
              label: 'Trang chủ',
            ),
            BottomNavigationBarItem(
              icon: _badgeCount != 0
                  ? const Badge(
                      label: Text(' '),
                      child: Icon(
                        Icons.notifications,
                      ),
                    )
                  : const Icon(
                      Icons.notifications,
                    ),
              label: 'Thông báo',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
              ),
              label: 'Tin nhắn',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'Hồ sơ',
            ),
          ],
          currentIndex: _selectedIndex,
          backgroundColor: const Color.fromARGB(255, 110, 194, 247),
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
              if (_selectedIndex == 1) {
                _badgeCount = 0;
              }
            });
          },
        ),
      ),
    );
  }
}
