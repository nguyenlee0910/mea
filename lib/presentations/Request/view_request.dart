import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mea/models/base_request_model.dart';
import 'package:mea/models/import_request_model.dart';
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
        }
      });
      debugPrint(requestData.toString());
    });
  }

  @override
  void initState() {
    super.initState();

    getAllRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Theo dõi đơn yêu cầu'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 110, 194, 247),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.grey[100]),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
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
                child: ListView.builder(
                  itemBuilder: (context, index) => _buildImportRequestCell(
                    context: context,
                    requestModel: requestData[index],
                  ),
                  itemCount: requestData.length,
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
  required BuildContext context,
  required BaseRequestModel requestModel,
}) {
  return Neumorphic(
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
                    : "Đơn yêu cầu sửa chữa thiết bị",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Gap(12),
              if (requestModel is RepairRequestModel) ...[
                Text(
                  "Mã máy: ${(requestModel as RepairRequestModel).equipment.code}",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                ),
                const Gap(12),
                Text(
                  "Tên máy: ${(requestModel as RepairRequestModel).equipment.name}",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                ),
              ],
              ElevatedButton(
                child: Text('Xem chi tiết'),
                onPressed: () {
                  context.push(
                    '/${ViewRequestDetail.routeName}',
                    extra: requestModel,
                  );
                },
              )
            ],
          ),
        )),
  );
}

mixin _$RepairRequestModelImpl {}
