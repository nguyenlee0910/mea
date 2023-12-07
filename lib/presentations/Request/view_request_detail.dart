import 'package:flutter/material.dart';
import 'package:mea/models/base_request_model.dart';
import 'package:mea/models/repair_request_model.dart';
import 'package:mea/presentations/Request/view_request.dart';
import 'package:intl/intl.dart';
import '../../models/import_request_items_model.dart';
import '../../models/import_request_model.dart';
import '../../widgets/equipment_import_request_cell.dart';

class ViewRequestDetail extends StatelessWidget {
  ViewRequestDetail({required this.baseRequestModel, super.key});

  static const routeName = 'view_request_detail';
  final BaseRequestModel baseRequestModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final importRequestModel = (baseRequestModel as ImportRequestModel)
    //     .importRequestItemsModel
    //     ?.map((e) => e.supply.first.name);
    final formatter = DateFormat('dd/MM/yyyy hh:mm');
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
              if (baseRequestModel is RepairRequestModel) ...[
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 20),
                  child: Text(
                    'Chi tiết đơn yêu cầu sửa chữa',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0033FF),
                    ),
                  ),
                ),
              ],
              if (baseRequestModel is ImportRequestModel) ...[
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 20),
                  child: Text(
                    'Chi tiết đơn yêu cầu thiết bị',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0033FF),
                    ),
                  ),
                ),
              ],
              if (baseRequestModel is RepairRequestModel &&
                  (baseRequestModel as RepairRequestModel)
                          .repairReportItems
                          ?.length !=
                      0) ...[
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 15),
                  child: Text(
                    'Người lập',
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
                    (baseRequestModel as RepairRequestModel).createdBy.name,
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
              if (baseRequestModel is ImportRequestModel) ...[
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 15),
                  child: Text(
                    'Người lập',
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
                    (baseRequestModel as ImportRequestModel).createdBy?.name ??
                        'Unknown',
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
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 15),
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
                padding: const EdgeInsets.only(left: 15, right: 15),
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
              if ((baseRequestModel is ImportRequestModel) &&
                  (baseRequestModel as ImportRequestModel).status ==
                      "REQUESTING") ...[
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 30),
                  child: Text(
                    'Thông tin thiết bị yêu cầu',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0033FF),
                    ),
                  ),
                ),
                DataTable(
                  columnSpacing: 20.0, // Điều chỉnh khoảng cách giữa các cột
                  horizontalMargin:
                      15.0, // Điều chỉnh khoảng cách giữa mép của bảng và các cột
                  columns: [
                    DataColumn(
                      label: Text(
                        'Tên vật tư',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'SL',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                  rows: (baseRequestModel as ImportRequestModel)
                      .importRequestItems!
                      .map(
                        (element) => DataRow(
                          cells: [
                            DataCell(
                              Text(
                                element.supply?.name ?? 'Empty',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            DataCell(
                              Text(
                                element.quantity?.toString() ?? '0',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ],
              if (baseRequestModel is RepairRequestModel &&
                  (baseRequestModel as RepairRequestModel)
                          .repairReportItems
                          ?.length !=
                      0) ...[
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 15),
                  child: Text(
                    'Thời gian máy móc bắt đầu có vấn đề',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      formatter.format(
                        DateTime.parse(
                          ((baseRequestModel as RepairRequestModel)
                                  .brokenDate ??
                              (baseRequestModel as RepairRequestModel)
                                  .createdAt ??
                              DateTime.now().toString()),
                        ).toLocal(),
                      ),
                      style: const TextStyle(
                        color: Color(0xFF1A1A1A),
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    )),
              ],
              if (baseRequestModel.status != 'REQUESTING') ...[
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 8, right: 15),
                  child: Divider(
                    thickness: 1, // Adjust the thickness as needed
                    color: Colors.grey, // Set the color of the divider
                  ),
                ),
              ],
              if (baseRequestModel is RepairRequestModel &&
                  (baseRequestModel as RepairRequestModel).status !=
                      'REQUESTING' &&
                  (baseRequestModel as RepairRequestModel).status !=
                      'CANCELLED' &&
                  (baseRequestModel as RepairRequestModel)
                          .repairReportItems
                          ?.length !=
                      0) ...[
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 8),
                  child: Text(
                    'Người duyệt đơn',
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
                    (baseRequestModel as RepairRequestModel).updatedBy.name,
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
              if (baseRequestModel is ImportRequestModel &&
                  (baseRequestModel as ImportRequestModel).status !=
                      'REQUESTING' &&
                  (baseRequestModel as ImportRequestModel).status !=
                      'CANCELLED') ...[
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 8),
                  child: Text(
                    'Người duyệt đơn',
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
                    (baseRequestModel as ImportRequestModel).updatedBy?.name ??
                        'Unknown',
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
              if (baseRequestModel is RepairRequestModel &&
                  (baseRequestModel as RepairRequestModel).status ==
                      'CANCELLED' &&
                  (baseRequestModel as RepairRequestModel)
                          .repairReportItems
                          ?.length !=
                      0) ...[
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 8),
                  child: Text(
                    'Người từ chối',
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
                    (baseRequestModel as RepairRequestModel).updatedBy.name,
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
              if (baseRequestModel is ImportRequestModel &&
                  (baseRequestModel as ImportRequestModel).status ==
                      'CANCELLED') ...[
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 8),
                  child: Text(
                    'Người từ chối',
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
                    (baseRequestModel as ImportRequestModel).updatedBy?.name ??
                        'Unknown',
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
              const SizedBox(height: 15),
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
                      padding: const EdgeInsets.only(left: 15, right: 15),
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
                        'Lý do từ chối đơn',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
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
                      0 &&
                  (baseRequestModel as ImportRequestModel).status !=
                      "REQUESTING") ...[
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 30),
                  child: Text(
                    'Thông tin thiết bị được giao',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0033FF),
                    ),
                  ),
                ),
                DataTable(
                  columnSpacing: 20.0, // Điều chỉnh khoảng cách giữa các cột
                  horizontalMargin:
                      15.0, // Điều chỉnh khoảng cách giữa mép của bảng và các cột
                  columns: [
                    DataColumn(
                      label: Text(
                        'Tên vật tư',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'SL',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'SLTT',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                  rows: (baseRequestModel as ImportRequestModel)
                      .importRequestItems!
                      .map(
                        (element) => DataRow(
                          cells: [
                            DataCell(Text(
                              element.supply?.name ?? 'Empty',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            )),
                            DataCell(Text(
                              element.quantity?.toString() ?? '0',
                              style: TextStyle(fontSize: 16),
                            )),
                            DataCell(Text(
                              element.approveQuantity?.toString() ?? '0',
                              style: TextStyle(fontSize: 16),
                            )),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ],
              if (baseRequestModel is RepairRequestModel &&
                  (baseRequestModel as RepairRequestModel).status !=
                      'REQUESTING' &&
                  (baseRequestModel as RepairRequestModel).status !=
                      'CANCELLED' &&
                  (baseRequestModel as RepairRequestModel)
                          .repairReportItems
                          ?.length !=
                      0) ...[
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 30),
                  child: Text(
                    'Chi tiết kế hoạch sửa chữa',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0033FF),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 16),
                  child: Text(
                    'Thời gian bắt đầu sửa chữa',
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
                    formatter.format(
                      DateTime.parse(
                          (baseRequestModel as RepairRequestModel).startAt),
                    ),
                    style: const TextStyle(
                      color: Color(0xFF1A1A1A),
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 16),
                  child: Text(
                    'Thời gian kết thúc sửa chữa',
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
                    // Assuming startAt is a DateTime
                    formatter.format(
                      DateTime.parse(
                          (baseRequestModel as RepairRequestModel).endAt),
                    ),
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
            ],
          ),
        ),
      ),
    );
  }
}
