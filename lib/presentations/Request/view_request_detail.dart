import 'package:flutter/material.dart';
import 'package:mea/models/base_request_model.dart';
import 'package:mea/models/repair_request_model.dart';
import 'package:mea/presentations/Request/view_request.dart';

import '../../models/import_request_items_model.dart';
import '../../models/import_request_model.dart';
import '../../widgets/equipment_import_request_cell.dart';

class ViewRequestDetail extends StatelessWidget {
  ViewRequestDetail({required this.baseRequestModel, super.key});

  static const routeName = 'view_request_detail';
  final BaseRequestModel baseRequestModel;

  @override
  Widget build(BuildContext context) {
    // final importRequestModel = (baseRequestModel as ImportRequestModel)
    //     .importRequestItemsModel
    //     ?.map((e) => e.supply.first.name);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Chi Tiết',
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
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildImportRequestCell(
                isDetail: true,
                context: context,
                requestModel: baseRequestModel,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 10),
                child: Text(
                  'Mô tả đơn yêu cầu',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  baseRequestModel.description,
                  //softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 7,
                  style: const TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (baseRequestModel.status != 'REQUESTING' &&
                  baseRequestModel.status != 'UPDATED' &&
                  baseRequestModel.status != 'CANCELLED')
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'Ghi chú duyệt đơn',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        baseRequestModel.note,
                        maxLines: 100,
                        style: const TextStyle(
                          color: Color(0xFF1A1A1A),
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              // Kiểm tra nếu trạng thái là "CANCELLED" thì hiển thị lý do hủy đơn
              if (baseRequestModel.status == 'CANCELLED')
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'Lý do hủy đơn',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        baseRequestModel.note,
                        maxLines: 100,
                        style: const TextStyle(
                          color: Color(0xFF1A1A1A),
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              if (baseRequestModel is ImportRequestModel &&
                  (baseRequestModel as ImportRequestModel)
                          .importRequestItems
                          ?.length !=
                      0) ...[
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 16),
                  child: Text(
                    'Thiết bị được giao',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                // ListView.builder(
                //   itemBuilder: (context, index) {
                //     return EquipmentImportRequestCell(
                //       name: (baseRequestModel as ImportRequestModel)
                //               .importRequestItems?[index]
                //               .supply
                //               ?.name ??
                //           'Empty',
                //       quantity: (baseRequestModel as ImportRequestModel)
                //               .importRequestItems?[index]
                //               .quantity ??
                //           0,
                //       unit: (baseRequestModel as ImportRequestModel)
                //               .importRequestItems?[index]
                //               .supply
                //               ?.unit ??
                //           'none',
                //     );
                //   },
                //   itemCount: (baseRequestModel as ImportRequestModel)
                //           .importRequestItems
                //           ?.length ??
                //       0,
                // ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: (baseRequestModel as ImportRequestModel)
                        .importRequestItems!
                        .map((element) => Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: EquipmentImportRequestCell(
                                  name: element.supply?.name ?? '',
                                  quantity: element.quantity ?? 0,
                                  unit: element.supply?.unit ?? ''),
                            ))
                        .toList(),
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
