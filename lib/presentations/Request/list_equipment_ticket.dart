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
import 'package:mea/models/repair_request_model.dart';
import 'package:mea/presentations/Request/view_request_detail.dart';
import 'package:mea/services/device_request_api.dart';

class ListEquipmentTicket extends StatefulWidget {
  const ListEquipmentTicket({Key? key}) : super(key: key);
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
        title: const Text('Đơn yêu cầu thiết bị'),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.grey[100]),
        child: Column(
          children: <Widget>[
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
  var formatter = DateFormat('dd.MM.yyyy');
  var createDateString = formatter.format(createDate);
  var color = Colors.black;
  var createdBy = createDate;

  String statusText = '';
  switch (requestModel.status) {
    case 'REQUESTING':
      color = Colors.yellow.shade800;
      statusText = 'Chờ xác nhận'; // Gán giá trị 'Chờ xác nhận' cho statusText
      break;
    case 'APPROVED':
      color = Colors.green;
      statusText = 'Đã duyệt';
      break;
    case 'CANCELLED':
      color = Colors.red;
      statusText = 'Đã hủy';
      break;
    case 'UPDATED':
      color = Colors.blue;
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
        height: 151,
        decoration: const BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                requestModel is ImportRequestModel
                    ? (requestModel as ImportRequestModel).name
                    : 'Đơn yêu cầu sửa chữa thiết bị',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Gap(12),
              Row(
                children: [
                  if (requestModel is RepairRequestModel) ...[const Gap(24)],
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(text: "Trạng thái: ", children: [
                        TextSpan(
                          text:
                              statusText, // Sử dụng statusText thay vì requestModel.status
                          style: TextStyle(fontSize: 14, color: color),
                        ),
                      ])),
                      const Gap(12),
                      Text(
                        "Ngày tạo: $createDateString",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ],
              ),
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
