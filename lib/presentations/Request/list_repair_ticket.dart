import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mea/models/base_request_model.dart';
import 'package:mea/models/import_request_model.dart';
import 'package:mea/models/repair_request_model.dart';
import 'package:mea/presentations/Request/view_request_detail.dart';
import 'package:mea/services/device_request_api.dart';

class ListRepairTicket extends StatefulWidget {
  const ListRepairTicket({super.key});
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
      // debugPrint('[DEBUG] $requestData');
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
              tabs: const [
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
    var tabFilterList = <BaseRequestModel>[];

    if (status == 'ALL') {
      tabFilterList = requestData;
    } else if (status == 'CANCELLED') {
      // Lọc các đơn có status là 'Chờ xác nhận' hoặc 'Đã cập nhật'
      tabFilterList = requestData
          .where(
            (request) =>
                request.status == 'CANCELLED' || request.status == 'REJECTED',
          )
          .toList();
    } else if (status == 'APPROVED') {
      // Lọc các đơn có status là 'Chờ xác nhận' hoặc 'Đã cập nhật'
      tabFilterList = requestData
          .where(
            (request) =>
                request.status == 'APPROVED' ||
                request.status == 'COMPLETED' ||
                request.status == 'FIXING',
            // || request.status == 'CANCELLED'
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
    final createDate = DateTime.parse(requestModel.createdAt);
    final formatter = DateFormat('dd/MM/yyyy hh:mm:ss');
    final createDateString = formatter.format(createDate);
    var color = Colors.black;

    var statusText = '';
    switch (requestModel.status) {
      case 'REQUESTING':
        color = const Color.fromARGB(255, 211, 145, 38);
        statusText = 'Đang yêu cầu';
      case 'COMPLETED':
        color = const Color.fromARGB(255, 67, 153, 70);
        statusText = 'Hoàn thành';
      case 'PAUSED':
        color = const Color.fromARGB(255, 80, 27, 165);
        statusText = 'Tạm dừng sửa chữa';
      case 'CANCELLED':
        color = const Color.fromARGB(255, 221, 60, 48);
        statusText = 'Hủy sửa chữa';
      case 'REJECTED':
        color = const Color.fromARGB(255, 221, 60, 48);
        statusText = 'Đã từ chối';
      case 'FIXING':
        color = const Color.fromARGB(255, 30, 89, 216);
        statusText = 'Đang sửa chữa';
      case 'DRAFT':
        color = const Color.fromARGB(255, 51, 51, 51);
        statusText = 'Nháp';
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
            height: 160,
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
                          : 'Đơn sửa chữa thiết bị y tế',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Gap(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Mã máy: ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            (requestModel as RepairRequestModel)
                                    .repairReportItems
                                    ?.first
                                    .equipment
                                    ?.code ??
                                'Trống',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
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
                              'Tên máy: ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            child: Flexible(
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                (requestModel as RepairRequestModel)
                                        .repairReportItems
                                        ?.first
                                        .equipment
                                        ?.name ??
                                    'Trống',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
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
                              'Trạng thái: ',
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
            ),
          ),
        ),
      ),
    );
  }
}
