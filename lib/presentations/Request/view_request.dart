import 'dart:async';

import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mea/models/base_request_model.dart';
import 'package:mea/models/import_request_model.dart';
import 'package:mea/models/repair_report_model.dart';
import 'package:mea/models/repair_request_model.dart';
import 'package:mea/presentations/Request/view_request_detail.dart';
import 'package:mea/services/device_request_api.dart';

class ViewRequest extends StatefulWidget {
  const ViewRequest({super.key});
  static const routeName = 'view_request';
  @override
  State<ViewRequest> createState() => _ViewRequestState();
}

class _ViewRequestState extends State<ViewRequest> {
  List<BaseRequestModel> requestData = [];
  int selectedIndex = 0;
  List<BaseRequestModel> filterList = [];

  Future<void> getAllRequest() async {
    await Future.wait(
      [
        DeviceRequestService.getImportRequests(),
        DeviceRequestService.getRepairRequests(),
      ],
    ).then((resultArary) {
      debugPrint(resultArary.toString());
      setState(() {
        if (resultArary.isNotEmpty) {
          requestData
            ..addAll(resultArary[0])
            ..addAll(resultArary[1]);
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
    final children = <int, Widget>{
      0: const Text('Tất cả'),
      1: const Text('Đơn sửa chữa thiết bị'),
      2: const Text('Đơn yêu cầu thiết bị'),
    };
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Đơn yêu cầu thiết bị'),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.grey[100]),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: CustomSlidingSegmentedControl<int>(
                  initialValue: selectedIndex,
                  children: children,
                  decoration: BoxDecoration(
                    color: CupertinoColors.lightBackgroundGray,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  thumbDecoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.3),
                        blurRadius: 4,
                        spreadRadius: 1,
                        offset: const Offset(
                          0,
                          2,
                        ),
                      ),
                    ],
                  ),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInToLinear,
                  onValueChanged: (v) {
                    setState(() {
                      setState(() {
                        selectedIndex = selectedIndex;
                        if (v == 0) {
                          filterList = requestData;
                        } else if (v == 1) {
                          filterList = requestData
                              .whereType<RepairReportModel>()
                              .toList();
                        } else {
                          filterList = requestData
                              .whereType<ImportRequestModel>()
                              .toList();
                        }
                      });
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: ListView.builder(
                  itemBuilder: (context, index) => buildImportRequestCell(
                    context: context,
                    requestModel: filterList[index],
                  ),
                  itemCount: filterList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildImportRequestCell({
  required BuildContext context,
  required BaseRequestModel requestModel,
  bool isDetail = false,
}) {
  final createDate = DateTime.parse(requestModel.createdAt);
  final formatter = DateFormat('dd/MM/yyyy hh:mm:ss');
  final createDateString = formatter.format(createDate.add(Duration(hours: 7)));
  var color = Colors.black;

  var statusText = '';
  switch (requestModel.status) {
    case 'REQUESTING':
      color = const Color.fromARGB(255, 211, 145, 38);
      statusText = "Chờ xác nhận";
      break;

    case 'APPROVED':
      color = const Color.fromARGB(255, 67, 153, 70);
      statusText = 'Đã duyệt';
      break;

    case 'CANCELLED':
      color = const Color.fromARGB(255, 221, 60, 48);
      statusText = 'Đã từ chối';
      break;

    case 'REJECTED':
      color = const Color.fromARGB(255, 221, 60, 48);
      statusText = 'Đã từ chối';
      break;

    case 'PAUSED':
      color = const Color.fromARGB(255, 80, 27, 165);
      statusText = 'Tạm dừng sửa chữa';
      break;

    case 'WAITING_FOR_SUPPLY':
      color = const Color.fromARGB(255, 80, 27, 165);
      statusText = 'Chờ cung cấp';
      break;

    case 'FIXING':
      color = const Color.fromARGB(255, 30, 89, 216);
      statusText = 'Đang sửa chữa';
      break;

    case 'COMPLETED':
      color = const Color.fromARGB(255, 67, 153, 70);
      statusText = 'Hoàn thành';
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
  final containerHeight = (requestModel is RepairRequestModel) ? 175.0 : 135.0;
  final size = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.all(12),
    child: Neumorphic(
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
        depth: 6,
        color: Colors.grey,
        intensity: 1,
      ),
      child: Container(
        width: size.width - 40,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 219, 236, 248),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 5),
                child: Text(
                  requestModel is ImportRequestModel
                      ? requestModel.name
                      : 'Đơn sửa chữa thiết bị ${((requestModel as RepairRequestModel).repairReportItems?.first?.equipment?.name) ?? 'Trống'}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Gap(12),
              if (requestModel is RepairRequestModel) ...[
                Row(
                  children: [
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
                                      ?.firstOrNull
                                      ?.equipment
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
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: SizedBox(
                            // 40 padding ngoài mỗi bên 20 và khoảng 40 padding trong khung
                            // không cần cho height để nó tự động dãn
                            width: size.width - 40 - 40,
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Tên máy: ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: (requestModel as RepairRequestModel)
                                            .repairReportItems
                                            ?.firstOrNull
                                            ?.equipment
                                            ?.name ??
                                        'Trống',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
              // const Gap(6),
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
              const Gap(6),
              if (requestModel is ImportRequestModel) ...[
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
                      (requestModel is ImportRequestModel)
                          ? requestModel.expected == 'HOUR_72'
                              ? '72 giờ'
                              : requestModel.expected == 'HOUR_1'
                                  ? '1 giờ'
                                  : requestModel.expected == 'HOUR_3'
                                      ? '3 giờ'
                                      : requestModel.expected == 'HOUR_5'
                                          ? '5 giờ'
                                          : requestModel.expected == 'HOUR_24'
                                              ? '24 giờ'
                                              : requestModel.expected ==
                                                      'HOUR_36'
                                                  ? '36 giờ'
                                                  : (requestModel
                                                          is ImportRequestModel
                                                      ? requestModel.expected
                                                      : '')
                          : '',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const Gap(6),
              ],
              if (isDetail == false) ...[
                ElevatedButton(
                  child: const Text('Xem chi tiết'),
                  onPressed: () {
                    context.push(
                      '/${ViewRequestDetail.routeName}',
                      extra: requestModel,
                    );
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    ),
  );
}
