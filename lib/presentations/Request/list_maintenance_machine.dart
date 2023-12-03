import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mea/models/feedback_status_model.dart';
import 'package:mea/models/user_model.dart';
import 'package:mea/presentations/Request/maintenance_detail.dart';
import 'package:mea/services/department_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListFeedbackStatus extends StatefulWidget {
  const ListFeedbackStatus({Key? key}) : super(key: key);

  static const routeName = 'list_feedback';

  @override
  _ListFeedbackStatusState createState() => _ListFeedbackStatusState();
}

class _ListFeedbackStatusState extends State<ListFeedbackStatus>
    with SingleTickerProviderStateMixin {
  UserModel userModel = UserModel();
  String departmentId = '';
  List<FeedbackStatusModel> feedbackList = [];
  final TextEditingController _searchController = TextEditingController();
  bool isLoading = true;
  String errorMessage = '';
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    getData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> getData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userDataString = prefs.getString('userData');
      if (userDataString != null) {
        final data = jsonDecode(userDataString) as Map<String, dynamic>;
        setState(() {
          userModel = UserModel.fromJson(data);
          departmentId = prefs.getString('departmentId') ?? 'NULL';
        });
      }

      await fetchFeedbackStatusData();
    } catch (error) {
      print('Error getting user data: $error');
    }
  }

  Future<void> refreshFeedbackList() async {
    await fetchFeedbackStatusData();
  }

  Future<void> refreshData() async {
    setState(() {
      isLoading = true;
    });

    await fetchFeedbackStatusData();

    setState(() {
      isLoading = false;
    });
  }

  Future<void> showConfirmationDialog(
      BuildContext context, FeedbackStatusModel feedback) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Xác nhận'),
          content: const Text(
              'Vui lòng xác nhận tình trạng máy móc sau khi bàn giao'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: ElevatedButton(
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
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
                          Navigator.of(context).pop();
                          await fetchFeedbackStatusData();
                          refreshData();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Gọi API không thành công: ${response.statusCode}'),
                            ),
                          );
                        }
                      } catch (error) {
                        // Xử lý khi gặp lỗi trong quá trình gọi API
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Đã xảy ra lỗi: $error'),
                          ),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 230, 63, 51)),
                    ),
                    child: const Text('Không hoạt động'),
                  ),
                ),
                Spacer(),
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  child: ElevatedButton(
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
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
                          Navigator.of(context).pop();
                          await fetchFeedbackStatusData();
                          refreshData();
                          // });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Gọi API không thành công: ${response.statusCode}'),
                            ),
                          );
                        }
                      } catch (error) {
                        // Xử lý khi gặp lỗi trong quá trình gọi API
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Đã xảy ra lỗi: $error'),
                          ),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 39, 141, 224),
                      ),
                    ),
                    child: const Text('Hoạt động tốt'),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<void> fetchFeedbackStatusData() async {
    try {
      setState(() {
        isLoading = true;
      });

      final departmentServices = DepartmentServices();
      final feedbackData = await departmentServices.getFeedbackStatus(
        departmentId: departmentId,
      );

      setState(() {
        if (feedbackData.isNotEmpty) {
          feedbackList = feedbackData;
          errorMessage = '';
        } else {
          errorMessage = 'No feedback data available.';
        }

        isLoading = false;
      });
    } catch (error) {
      print('Error fetching feedback status: $error');

      setState(() {
        isLoading = false;
        errorMessage = 'Error fetching data. Please try again later.';
      });
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

  Widget buildDateTimeRow(String label, dynamic dateTime) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Text(
            formatDateTime(dateTime),
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFeedbackListByStatus(List<String> statuses) {
    final filteredList = feedbackList
        .where((feedback) => statuses.contains(feedback.status))
        .toList();

    return Column(
      children: <Widget>[
        if (filteredList.isEmpty)
          Expanded(
            child: Center(
              child: isLoading
                  ? CircularProgressIndicator()
                  : Text('Không có dữ liệu.'),
            ),
          )
        else
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                final feedback = filteredList[index];
                if (feedback != null) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MaintenanceDetailPage(feedback: feedback),
                        ),
                      ).then((value) {
                        if (value != null && value is String) {
                          showConfirmationDialog(context, feedback);
                        }
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.02,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Card(
                            elevation: 2,
                            shadowColor: Colors.black,
                            color: feedback.status == 'COMPLETED'
                                ? Colors.red
                                : Colors.blue,
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: feedback.status == 'COMPLETED'
                                      ? const Color.fromARGB(255, 71, 163, 74)
                                      : feedback.status == 'CANCELLED'
                                          ? Colors.grey
                                          : const Color.fromARGB(
                                              255,
                                              30,
                                              131,
                                              214,
                                            ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  feedback.status == 'COMPLETED'
                                      ? 'Hoàn thành'
                                      : feedback.status == 'CANCELLED'
                                          ? 'Đã hủy bảo trì'
                                          : feedback.status == 'WAITING'
                                              ? 'Chờ sửa chữa'
                                              : feedback.status == 'FIXING'
                                                  ? 'Đang sửa chữa'
                                                  : feedback.status == 'PAUSED'
                                                      ? 'Tạm dừng sửa chữa'
                                                      : feedback.status ??
                                                          'N/A',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              tileColor:
                                  const Color.fromARGB(255, 219, 236, 248),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Gap(8),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Tên máy: ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          feedback.equipment!.name ?? 'N/A',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Gap(2),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Mã máy: ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          feedback.equipment!.code ?? 'N/A',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Gap(2),
                                  if (feedback.status == 'COMPLETED') ...[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        children: [
                                          const Text(
                                            'Xác nhận: ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            feedback.feedbackStatus ==
                                                    'ACCEPTED'
                                                ? 'Hoạt động tốt'
                                                : feedback.feedbackStatus ==
                                                        'REJECTED'
                                                    ? 'Không hoạt động'
                                                    : 'Chưa xác nhận',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                              color: feedback.feedbackStatus ==
                                                      'ACCEPTED'
                                                  ? const Color.fromARGB(
                                                      255, 28, 123, 201)
                                                  : feedback.feedbackStatus ==
                                                          'REJECTED'
                                                      ? Colors.red
                                                      : Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                  const Gap(2),
                                  buildDateTimeRow(
                                    'Thời gian tạo',
                                    feedback.createdAt,
                                  ),
                                  const Gap(6),
                                  const SizedBox(height: 8),
                                  if (feedback.status == 'COMPLETED' &&
                                      feedback.feedbackStatus != 'ACCEPTED' &&
                                      feedback.feedbackStatus !=
                                          'REJECTED') ...[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          top: BorderSide(
                                            color: Color.fromARGB(
                                              255,
                                              156,
                                              209,
                                              241,
                                            ),
                                            width: 1.5,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Container(
                                            constraints: const BoxConstraints(
                                                maxWidth: 240),
                                            child: const Text(
                                              'Vui lòng chỉ nhấn "Xác nhận" khi thiết bị bảo trì đã bàn giao đến phòng ban.',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: ElevatedButton(
                                            onPressed: () async {
                                              await showConfirmationDialog(
                                                context,
                                                feedback,
                                              );
                                            },
                                            child: const Text('Xác nhận'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return const Card(
                    color: Colors.blue,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      tileColor: Colors.white,
                      title: Text('Dữ liệu phản hồi không hợp lệ'),
                    ),
                  );
                }
              },
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Xác nhận bảo trì, sửa chữa',
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
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Đã hoàn thành'),
            Tab(text: 'Đang sửa chữa'),
            Tab(text: 'Đã hủy sửa chữa'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Đã hoàn thành
          buildFeedbackListByStatus(['COMPLETED']),

          // Đang sửa chữa
          buildFeedbackListByStatus(['WAITING', 'FIXING', 'PAUSED']),

          // Đã hủy sửa chữa
          buildFeedbackListByStatus(['CANCELLED']),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: ListFeedbackStatus(),
      ),
    ),
  );
}
