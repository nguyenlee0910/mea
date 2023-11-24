import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:mea/models/base_request_model.dart';
import 'package:mea/models/import_request_model.dart';
import 'package:mea/models/repair_request_model.dart';
import 'package:mea/presentations/Request/view_request_detail.dart';
import 'package:mea/services/device_request_api.dart';
import 'package:go_router/go_router.dart';

class ListRepairTicket extends StatefulWidget {
  const ListRepairTicket({Key? key}) : super(key: key);
  static const routeName = 'list_repair';

  @override
  State<ListRepairTicket> createState() => _ListRepairTicketState();
}

class _ListRepairTicketState extends State<ListRepairTicket> {
  List<BaseRequestModel> requestData = [];
  int selectedIndex = 0;
  List<BaseRequestModel> filterList = [];

  Future<void> getAllRequest() async {
    await DeviceRequestService.getRepairRequests().then((resultArray) {
      debugPrint(resultArray.toString());
      setState(() {
        if (resultArray.isNotEmpty) {
          requestData.addAll(resultArray);
          filterList = requestData;
        }
      });
      debugPrint(requestData.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
    getAllRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Đơn sửa chữa thiết bị',
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
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            TabBar(
              indicatorColor: Colors.blue[900],
              labelColor: Colors.blue[900],
              tabs: [
                Tab(text: 'Tất cả'),
                Tab(text: 'Đang chờ'),
                Tab(text: 'Đã duyệt'),
                Tab(text: 'Đã hủy'),
              ],
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Replace the content of each TabBarView with the corresponding list.
                  buildTabContent(status: 'ALL'),
                  buildTabContent(status: 'REQUESTING'),
                  buildTabContent(status: 'APPROVED'),
                  buildTabContent(status: 'CANCELLED'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTabContent({required String status}) {
    List<BaseRequestModel> tabFilterList = [];

    if (status == 'ALL') {
      tabFilterList = requestData;
    } else if (status == 'REQUESTING') {
      // Lọc các đơn có status là 'Chờ xác nhận' hoặc 'Đã cập nhật'
      tabFilterList = requestData
          .where((request) =>
              request.status == 'REQUESTING' || request.status == 'UPDATED')
          .toList();
    } else if (status == 'CANCELLED') {
      // Lọc các đơn có status là 'Chờ xác nhận' hoặc 'Đã cập nhật'
      tabFilterList = requestData
          .where((request) =>
              request.status == 'CANCELLED' || request.status == 'REJECTED')
          .toList();
    } else if (status == 'APPROVED') {
      // Lọc các đơn có status là 'Chờ xác nhận' hoặc 'Đã cập nhật'
      tabFilterList = requestData
          .where((request) =>
              request.status == 'APPROVED' || request.status == 'COMPLETED')
          .toList();
    } else {
      // Lọc theo status khác
      tabFilterList =
          requestData.where((request) => request.status == status).toList();
    }

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: ListView.builder(
        itemBuilder: (context, index) => buildImportRequestCell(
          context: context,
          requestModel: tabFilterList[index],
        ),
        itemCount: tabFilterList.length,
      ),
    );
  }

  Widget buildImportRequestCell({
    required BuildContext context,
    required BaseRequestModel requestModel,
  }) {
    DateTime createDate = DateTime.parse(requestModel.createdAt);
    var formatter = DateFormat('dd/MM/yyyy hh:mm:ss');
    var createDateString = formatter.format(createDate);
    var color = Colors.black;

    String statusText = '';
    switch (requestModel.status) {
      case 'REQUESTING':
        color = Color.fromARGB(255, 211, 145, 38);
        statusText = 'Chờ xác nhận';
        break;
      case 'APPROVED':
        color = const Color.fromARGB(255, 67, 153, 70);
        statusText = 'Đã duyệt';
        break;
      case 'COMPLETED':
        color = const Color.fromARGB(255, 67, 153, 70);
        statusText = 'Đã bảo trì';
        break;
      case 'CANCELLED':
        color = const Color.fromARGB(255, 221, 60, 48);
        statusText = 'Đã hủy';
        break;
      case 'REJECTED':
        color = const Color.fromARGB(255, 221, 60, 48);
        statusText = 'Đã từ chối';
        break;
      case 'UPDATED':
        color = Color.fromARGB(255, 30, 89, 216);
        statusText = 'Đã cập nhật';
        break;
      case 'DRAFT':
        color = const Color.fromARGB(255, 51, 51, 51);
        statusText = 'Nháp';
        break;
      default:
        color = Colors.black;
        break;
    }

    return GestureDetector(
      onTap: () {
        // Chuyển hướng đến màn hình chi tiết
        context.push(
          '/${ViewRequestDetail.routeName}',
          extra: requestModel,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Neumorphic(
          style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
            depth: 6,
            color: const Color.fromARGB(255, 158, 158, 158),
            intensity: 1,
          ),
          child: Container(
            width: 396,
            height: 180,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 219, 236, 248)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      requestModel is ImportRequestModel
                          ? (requestModel as ImportRequestModel).name
                          : 'Đơn sửa chữa thiết bị y tế',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Gap(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Mã máy: ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            (requestModel as RepairRequestModel)
                                    .equipment
                                    ?.code ??
                                'Trống',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      const Gap(6),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Tên máy: ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            (requestModel as RepairRequestModel)
                                    .equipment
                                    ?.name ??
                                'Trống',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      const Gap(6),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Trạng thái: ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            statusText,
                            style: TextStyle(
                              fontSize: 16,
                              color: color,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Gap(6),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Thời gian tạo: ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            createDateString,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
