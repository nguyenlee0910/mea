import 'package:flutter/material.dart';
import 'package:mea/models/notification_model.dart';

class NotificationDetail extends StatelessWidget {
  const NotificationDetail({super.key, required this.notificationModel});
  static const routeName = 'notification_detail';
  final NotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Chi tiết thông báo'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 110, 194, 247),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.transparent),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        'Người gửi',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        notificationModel.sender?.name ?? "NULL",
                        style: TextStyle(
                          color: Color(0xFF1A1A1A),
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        'Tiêu đề',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        notificationModel.content ?? 'NULL',
                        style: TextStyle(
                          color: Color(0xFF1A1A1A),
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        'Nội dung',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        notificationModel.title ?? "NULL",
                        softWrap: true,
                        style: TextStyle(
                          color: Color(0xFF1A1A1A),
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0,
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
