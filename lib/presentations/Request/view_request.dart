import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:go_router/go_router.dart';
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
    Map<int, Widget> _children = {
      0: Text('Tất cả'),
      1: Text('Đơn sửa chữa thiết bị'),
      2: Text('Đơn yêu cầu thiết bị'),
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
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: CustomSlidingSegmentedControl<int>(
                  initialValue: selectedIndex,
                  children: _children,
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
                        blurRadius: 4.0,
                        spreadRadius: 1.0,
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                      ),
                    ],
                  ),
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInToLinear,
                  onValueChanged: (v) {
                    setState(() {
                      setState(() {
                        selectedIndex = selectedIndex;
                        if (v == 0) {
                          filterList = requestData;
                        } else if (v == 1) {
                          filterList = requestData.where((element) {
                            return element is RepairReportModel;
                          }).toList();
                        } else {
                          filterList = requestData.where((element) {
                            return element is ImportRequestModel;
                          }).toList();
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
  DateTime createDate = DateTime.parse(requestModel.createdAt);
  var formatter = DateFormat('dd/MM/yyyy hh:mm:ss');
  var createDateString = formatter.format(createDate);
  var color = Colors.black;

  String statusText = '';
  switch (requestModel.status) {
    case 'REQUESTING':
      color = Color.fromARGB(255, 211, 145, 38);
      statusText = (requestModel is ImportRequestModel)
          ? 'Chờ xác nhận'
          : (requestModel is RepairReportModel)
              ? 'Đang yêu cầu'
              : '';
      break;
    case 'APPROVED':
      color = const Color.fromARGB(255, 67, 153, 70);
      statusText = 'Đã duyệt';
      break;
    case 'CANCELLED':
      color = const Color.fromARGB(255, 221, 60, 48);
      statusText = 'Đã hủy';
      break;
    case 'REJECTED':
      color = const Color.fromARGB(255, 221, 60, 48);
      statusText = 'Đã từ chối';
      break;
    case 'PAUSED':
      color = Color.fromARGB(255, 80, 27, 165);
      statusText = 'Tạm dừng sửa chữa';
      break;
    case 'FIXING':
      color = Color.fromARGB(255, 30, 89, 216);
      statusText = 'Đang sửa chữa';
      break;
    case 'COMPLETED':
      color = const Color.fromARGB(255, 67, 153, 70);
      statusText = 'Hoàn thành';
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
  double containerHeight = (requestModel is RepairReportModel) ? 160 : 135;
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
        width: 396,
        height: containerHeight,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 219, 236, 248),
        ),
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
                      : 'Đơn yêu cầu thiết bị y tế',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const Gap(12),
              if (requestModel is RepairReportModel) ...[
                Row(
                  children: [
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
                                      .repairReportItemsModel
                                      ?.first
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
                                      .repairReportItemsModel
                                      ?.first
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
                      ],
                    ),
                  ],
                ),
              ],
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
              if (requestModel is ImportRequestModel) ...[
                const Gap(6),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Khoảng thời gian nhận: ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      (requestModel is ImportRequestModel)
                          ? (requestModel as ImportRequestModel).expected ==
                                  'HOUR_72'
                              ? '72 giờ'
                              : (requestModel as ImportRequestModel).expected ==
                                      'HOUR_1'
                                  ? '1 giờ'
                                  : (requestModel as ImportRequestModel)
                                              .expected ==
                                          'HOUR_3'
                                      ? '3 giờ'
                                      : (requestModel as ImportRequestModel)
                                                  .expected ==
                                              'HOUR_5'
                                          ? '5 giờ'
                                          : (requestModel as ImportRequestModel)
                                                      .expected ==
                                                  'HOUR_24'
                                              ? '24 giờ'
                                              : (requestModel as ImportRequestModel)
                                                          .expected ==
                                                      'HOUR_36'
                                                  ? '36 giờ'
                                                  : (requestModel
                                                          is ImportRequestModel
                                                      ? (requestModel
                                                              as ImportRequestModel)
                                                          .expected
                                                      : '')
                          : '',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
              if (isDetail == false) ...[
                ElevatedButton(
                  child: Text('Xem chi tiết'),
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
