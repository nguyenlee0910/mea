import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:mea/models/base_request_model.dart';
import 'package:mea/models/import_request_model.dart';
import 'package:mea/models/repair_request_model.dart';
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
      1: Text('Đơn sửa chữa'),
      2: Text('Đơn yêu cầu'),
    };
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Theo dõi đơn yêu cầu'),
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
                            return element is RepairRequestModel;
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
                  itemBuilder: (context, index) => _buildImportRequestCell(
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

Widget _buildImportRequestCell({
  required BaseRequestModel requestModel,
}) {
  DateTime createDate = DateTime.parse(requestModel.createdAt);
  var formatter = DateFormat('dd.MM.yyyy');
  var createDateString = formatter.format(createDate);
  var color = Colors.black;

  switch (requestModel.status) {
    case 'REQUESTING':
      color = Colors.yellow.shade800;
    case 'APPROVED':
      color = Colors.green;
    case 'CANCELLED':
      color = Colors.red;
    default:
      color = Colors.black;
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
          height: 172,
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
                    if (requestModel is RepairRequestModel) ...[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mã máy: ${(requestModel as RepairRequestModel).equipment.code}",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
                          ),
                          const Gap(12),
                          Text(
                            "Tên máy: ${(requestModel as RepairRequestModel).equipment.name}",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ],
                    if (requestModel is RepairRequestModel) ...[const Gap(24)],
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(TextSpan(text: "Trạng thái: ", children: [
                          TextSpan(
                              text: requestModel.status,
                              style: TextStyle(fontSize: 14, color: color))
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
                ElevatedButton(
                  child: Text('Xem chi tiết'),
                  onPressed: () {},
                )
              ],
            ),
          )),
    ),
  );
}

mixin _$RepairRequestModelImpl {}
