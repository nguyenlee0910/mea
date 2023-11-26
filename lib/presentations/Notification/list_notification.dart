import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mea/models/notification_model.dart';
import 'package:mea/presentations/Notification/notification_detail.dart';
import 'package:mea/services/notification_api.dart';
import 'package:mea/widgets/notification_cell.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationCellData> filterCellData = [];
  List<NotificationModel> data = [];
  List<NotificationModel> notificationList = [];
  List<NotificationCellData> notificationCellData = [];

  void sortFilterCellDataByDate() {
    filterCellData.sort((a, b) {
      final dateA = DateTime.tryParse(a.iso8601Date) ?? DateTime(1970);
      final dateB = DateTime.tryParse(b.iso8601Date) ?? DateTime(1970);
      return dateB
          .compareTo(dateA); // Sorting in descending order (most recent first)
    });
  }

  Future<void> fetchData() async {
    await NotificationService.getNotification().then((value) {
      data = value;
      if (mounted || filterCellData.isEmpty) {
        setState(() {
          final temp = <NotificationCellData>[];
          notificationList = data;
          for (final i in data) {
            temp.add(
              NotificationCellData(
                status: i.status ?? 'READ',
                sender: i.sender?.name ?? 'NULL',
                content: i.content ?? 'NULL',
                iso8601Date: i.createdAt ?? 'NULL',
                title: i.title!,
              ),
            );
          }
          filterCellData = temp;
          sortFilterCellDataByDate(); // Sort the data by date
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.grey[100]),
        child: Column(
          children: <Widget>[
            // SizedBox(
            //   width: 352,
            //   height: 52,
            //   child: SearchBar(
            //     hintText: 'Tìm kiếm',
            //     leading: const Icon(Icons.search),
            //     backgroundColor: MaterialStateProperty.all(
            //       Colors.white.withOpacity(0.5),
            //     ),
            //     onChanged: (value) {
            //       setState(() {
            //         if (value.isEmpty) {
            //           filterCellData = notificationCellData;
            //           return;
            //         }
            //         filterCellData = notificationCellData.where((element) {
            //           return element.title.toLowerCase().contains(value);
            //         }).toList();
            //       });
            //     },
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
                child: filterCellData.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return NotificationCell(
                            status: filterCellData[index].status,
                            content: filterCellData[index].content,
                            sender: filterCellData[index].sender,
                            iso8601Date: filterCellData[index].iso8601Date,
                            title: filterCellData[index].title,
                            onPress: () {
                              if (filterCellData[index].status == 'READ') {
                                unawaited(
                                  NotificationService.makeAsReadDetail(
                                    data[index].id!,
                                  ),
                                );
                                setState(() {
                                  filterCellData[index].status = 'READ_DETAIL';
                                });
                              }

                              context.push(
                                '/${NotificationDetail.routeName}',
                                extra: notificationList[index],
                              );
                            },
                          );
                        },
                        itemCount: filterCellData.length,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
