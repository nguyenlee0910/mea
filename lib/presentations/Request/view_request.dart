import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
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
  List<RepairRequestModel> repairRequest = [];
  List<ImportRequestModel> importRequest = [];

  Future<void> getAllRequest() async {
    await Future.wait(
      [
        DeviceRequestService.getImportRequests(),
        DeviceRequestService.getRepairRequests(),
      ],
    ).then((resultArary) {
      setState(() {
        if (resultArary.isNotEmpty) {
          importRequest = resultArary[0] as List<ImportRequestModel>;
          repairRequest = resultArary[1] as List<RepairRequestModel>;
        }
      });
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
                  itemBuilder: (context, index) =>
                      _buildImportRequestCell(importRequest[index]),
                  itemCount: importRequest.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildImportRequestCell(ImportRequestModel importRequestModel) {
  return SizedBox(
      width: 200,
      height: 80,
      child: Column(
        children: [
          Text(importRequestModel.name),
          ElevatedButton(
            child: const Text('Test'),
            onPressed: () {},
          ),
        ],
      ),);
}
