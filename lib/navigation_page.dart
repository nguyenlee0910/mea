import 'package:flutter/material.dart';
import 'package:mea/presentations/Authencation/home.dart';
import 'package:mea/presentations/Notification/list_notification.dart';
import 'package:mea/presentations/UserManagement/user_management.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});
  static const routeName = 'navigation_page';

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    NotificationPage(),
    Container(),
    UserManagementPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> appBarName = [
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
              title: Text(appBarName[_selectedIndex]),
              flexibleSpace: Container(
                decoration: BoxDecoration(
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
          selectedItemColor: Colors.orange[900],
          selectedIconTheme: IconThemeData(color: Colors.orange[900]),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  //  color: Colors.white,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
              ),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
              ),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Profile'),
          ],
          currentIndex: _selectedIndex,
          backgroundColor: Color.fromARGB(255, 110, 194, 247),
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
        ),
      ),
    );
  }
}
