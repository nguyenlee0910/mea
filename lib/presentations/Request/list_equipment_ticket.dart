import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mea/models/base_request_model.dart';
import 'package:mea/models/import_request_model.dart';
import 'package:mea/presentations/Request/view_request_detail.dart';
import 'package:mea/services/device_request_api.dart';

class ListEquipmentTicket extends StatefulWidget {
  const ListEquipmentTicket({super.key});
  static const routeName = 'list_request';

  @override
  State<ListEquipmentTicket> createState() => _ListEquipmentTicketState();
}

class _ListEquipmentTicketState extends State<ListEquipmentTicket> {
  List<BaseRequestModel> requestData = [];
  int selectedIndex = 0;
  List<BaseRequestModel> filterList = [];

  Future<void> getAllRequest() async {
    await DeviceRequestService.getImportRequests().then((resultArray) {
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
          'Đơn yêu cầu thiết bị',
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
            Container(
              child: TabBar(
                isScrollable: true,
                indicatorColor: Colors.blue[900],
                labelColor: Colors.blue[900],
                tabs: [
                  Tab(text: 'Tất cả'),
                  Tab(text: 'Đang chờ duyệt'),
                  Tab(text: 'Đã duyệt'),
                  Tab(text: 'Đã từ chối'),
                ],
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
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
    var tabFilterList = <BaseRequestModel>[];

    if (status == 'ALL') {
      tabFilterList = requestData;
    } else if (status == 'APPROVED') {
      // Lọc các đơn có status là 'Chờ xác nhận' hoặc 'Đã cập nhật'
      tabFilterList = requestData
          .where(
            (request) =>
                request.status == 'APPROVED' ||
                request.status == 'UPDATED' ||
                request.status == 'COMPLETED',
          )
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
    final createDate =
        DateTime.parse(requestModel.createdAt).add(Duration(hours: 7));
    final formatter = DateFormat('dd/MM/yyyy HH:mm:ss');
    final createDateString = formatter.format(createDate);

    var color = Colors.black;

    var statusText = '';
    switch (requestModel.status) {
      case 'REQUESTING':
        color = const Color.fromARGB(255, 211, 145, 38);
        statusText = 'Chờ xác nhận';
        break;
      case 'APPROVED':
        color = const Color.fromARGB(255, 30, 89, 216);
        statusText = 'Đã duyệt';
        break;
      case 'COMPLETED':
        color = const Color.fromARGB(255, 67, 153, 70);
        statusText = 'Hoàn thành';
        break;
      case 'CANCELLED':
        color = const Color.fromARGB(255, 221, 60, 48);
        statusText = 'Đã từ chối';
        break;

      case 'UPDATED':
        color = const Color.fromARGB(255, 30, 89, 216);
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
            depth: 5,
            color: const Color.fromARGB(255, 158, 158, 158),
            intensity: 1,
          ),
          child: Container(
            width: 396,
            height: 130,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 219, 236, 248)),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      requestModel is ImportRequestModel
                          ? requestModel.name
                          : 'Đơn yêu cầu thiết bị y tế',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Gap(12),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                const Text(
                                  'Trạng thái: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
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
                          ),
                          const Gap(6),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'Khoảng thời gian nhận: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                (requestModel is ImportRequestModel &&
                                        requestModel.expected == 'HOUR_72')
                                    ? '72 giờ'
                                    : (requestModel as ImportRequestModel)
                                                .expected ==
                                            'HOUR_1'
                                        ? '1 giờ'
                                        : requestModel.expected == 'HOUR_3'
                                            ? '3 giờ'
                                            : requestModel.expected == 'HOUR_5'
                                                ? '5 giờ'
                                                : requestModel.expected ==
                                                        'HOUR_24'
                                                    ? '24 giờ'
                                                    : requestModel.expected ==
                                                            'HOUR_36'
                                                        ? '36 giờ'
                                                        : (requestModel
                                                                is ImportRequestModel
                                                            ? requestModel
                                                                .expected
                                                            : ''),
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const Gap(6),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'Thời gian tạo: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                createDateString,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
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
