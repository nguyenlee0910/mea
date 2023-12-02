// maintenance_detail.dart

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mea/models/feedback_status_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MaintenanceDetailPage extends StatelessWidget {
  final FeedbackStatusModel feedback;
  final VoidCallback? refreshCallback;

  const MaintenanceDetailPage({required this.feedback, this.refreshCallback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Chi tiết bảo trì, sửa chữa',
          style: TextStyle(
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Text(
                'Đơn bảo trì ${feedback.equipment?.name ?? "N/A"}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.only(left: 10),
              width: feedback.status == 'COMPLETED'
                  ? 110
                  : feedback.status == 'WAITING'
                      ? 125
                      : feedback.status == 'CANCELLED'
                          ? 130
                          : 110, // Default width is 110
              height: 39,
              decoration: BoxDecoration(
                color: feedback.status == 'COMPLETED'
                    ? Colors.green
                    : feedback.status == 'WAITING'
                        ? Colors.blue
                        : feedback.status == 'CANCELLED'
                            ? Colors.grey
                            : Colors.green, // Default color is green
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getFeedbackStatusText(feedback),
                      style: const TextStyle(
                        fontSize: 16.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tên máy',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 2.5),
                  Text(
                    feedback.equipment?.name ?? 'N/A',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Mã máy',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 2.5),
                  Text(
                    feedback.equipment?.code ?? 'N/A',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Chi tiết kế hoạch bảo trì',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 2.5),
                  Text(
                    feedback.description ?? 'N/A',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Thời gian tạo',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2.5),
                  Text(
                    formatDateTime(feedback.createdAt),
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            if (feedback.status == 'COMPLETED' &&
                    feedback.feedbackStatus == 'ACCEPTED' ||
                feedback.feedbackStatus == 'REJECTED') ...[
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Xác nhận',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2.5),
                    if (feedback.status == 'COMPLETED' &&
                        feedback.feedbackStatus == 'ACCEPTED')
                      Row(
                        children: [
                          const Text(
                            'Hoạt động tốt',
                            style: TextStyle(fontSize: 15),
                          ),
                          const SizedBox(width: 5),
                          ...List.generate(
                            5,
                            (index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      )
                    else if (feedback.status == 'COMPLETED' &&
                        feedback.feedbackStatus == 'REJECTED')
                      const Row(
                        children: [
                          Text(
                            'Không hoạt động',
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.clear,
                            color: Colors.red,
                          ),
                        ],
                      )
                    else
                      const Text(
                        'Chưa xác nhận',
                        style: TextStyle(fontSize: 15),
                      ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 8),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Row(
                          children: [
                            Container(
                              width: 165,
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: Color.fromARGB(255, 110, 194, 247),
                                    width: 1.5,
                                  ),
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.local_hospital,
                              color: Color.fromARGB(255, 110, 194, 247),
                              size: 22,
                            ),
                            Container(
                              width: 165,
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: Color.fromARGB(255, 110, 194, 247),
                                    width: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (feedback.status == 'COMPLETED' &&
                          feedback.feedbackStatus != 'ACCEPTED' &&
                          feedback.feedbackStatus != 'REJECTED') ...[
                        const Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Text(
                            'Vui lòng xác nhận tình trạng máy móc sau khi bàn giao',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 30),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    final prefs =
                                        await SharedPreferences.getInstance();
                                    final auth = prefs.getString('auth');
                                    final String url =
                                        'https://mea.monoinfinity.net/api/v1/repair-report-item/feedback/${feedback.id}';
                                    final Map<String, String> headers = {
                                      'Content-Type': 'application/json',
                                      'Accept': 'application/json',
                                      'Authorization': 'Bearer $auth',
                                    };
                                    final Map<String, String> body = {
                                      'feedbackStatus': 'REJECTED',
                                    };

                                    try {
                                      final response = await http.post(
                                        Uri.parse(url),
                                        headers: headers,
                                        body: jsonEncode(body),
                                      );

                                      if (response.statusCode == 201) {
                                        _showSucess(context, () {
                                          context.pop();
                                          context.pop();
                                        });
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Gọi API không thành công: ${response.statusCode}'),
                                          ),
                                        );
                                      }
                                    } catch (error) {
                                      // Xử lý khi gặp lỗi trong quá trình gọi API
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content:
                                              Text('Đã xảy ra lỗi: $error'),
                                        ),
                                      );
                                    }
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<
                                            Color>(
                                        const Color.fromARGB(255, 230, 63, 51)),
                                  ),
                                  child: const Text('Không hoạt động'),
                                ),
                              ),
                              Spacer(),
                              Container(
                                margin: EdgeInsets.only(right: 30.0),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    final prefs =
                                        await SharedPreferences.getInstance();
                                    final auth = prefs.getString('auth');
                                    final String url =
                                        'https://mea.monoinfinity.net/api/v1/repair-report-item/feedback/${feedback.id}';
                                    final Map<String, String> headers = {
                                      'Content-Type': 'application/json',
                                      'Accept': 'application/json',
                                      'Authorization': 'Bearer $auth',
                                    };
                                    final Map<String, String> body = {
                                      'feedbackStatus': 'ACCEPTED',
                                    };

                                    try {
                                      final response = await http.post(
                                        Uri.parse(url),
                                        headers: headers,
                                        body: jsonEncode(body),
                                      );

                                      if (response.statusCode == 201) {
                                        _showSucess(context, () {
                                          context.pop();
                                          context.pop();
                                        });
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Gọi API không thành công: ${response.statusCode}'),
                                          ),
                                        );
                                      }
                                    } catch (error) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content:
                                              Text('Đã xảy ra lỗi: $error'),
                                        ),
                                      );
                                    }
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      const Color.fromARGB(255, 39, 141, 224),
                                    ),
                                  ),
                                  child: const Text('Hoạt động tốt'),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Add additional details as needed
          ],
        ),
      ),
    );
  }

  String getFeedbackStatusText(FeedbackStatusModel feedback) {
    switch (feedback.status) {
      case 'COMPLETED':
        return 'Hoàn thành';
      case 'CANCELLED':
        return 'Đã hủy bảo trì';
      case 'WAITING':
        return 'Chờ sửa chữa';
      case 'FIXING':
        return 'Đang sửa chữa';
      case 'PAUSED':
        return 'Tạm dừng sửa chữa';
      default:
        return 'N/A';
    }
  }

  String getFeedbackStatusLabel(FeedbackStatusModel feedback) {
    if (feedback.status == 'COMPLETED') {
      return feedback.feedbackStatus == 'ACCEPTED'
          ? 'Hoạt động tốt'
          : feedback.feedbackStatus == 'REJECTED'
              ? 'Không hoạt động'
              : 'Chưa xác nhận';
    } else {
      return 'N/A';
    }
  }

  String formatDateTime(dynamic dateTime) {
    if (dateTime != null) {
      if (dateTime is String) {
        return DateFormat('dd/MM/yyyy HH:mm:ss')
            .format(DateTime.parse(dateTime));
      } else if (dateTime is DateTime) {
        return DateFormat('dd/MM/yyyy HH:mm:ss').format(dateTime);
      }
    }
    return 'N/A';
  }
}

void _showSucess(BuildContext context, VoidCallback? refreshCallback) {
  final alert = AlertDialog(
    title: const Text('Thành công'),
    content: const Text('Gửi xác nhận thành công!'),
    actions: [
      ElevatedButton(
        child: const Text('Xác nhận'),
        onPressed: () {
          Navigator.pop(context);
          refreshCallback?.call();
        },
      ),
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
