import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mea/models/equipment_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

class EquipmentDetail extends StatefulWidget {
  const EquipmentDetail({required this.equipmentModel, Key? key})
      : super(key: key);
  static const routeName = 'equipment_detail';
  final EquipmentModel equipmentModel;

  @override
  State<EquipmentDetail> createState() => _EquipmentDetailState();
}

class _EquipmentDetailState extends State<EquipmentDetail> {
  @override
  void initState() {
    super.initState();
    runZoned(() async {});
  }

  String getStatusLabel(String status) {
    if (status == 'ACTIVE') {
      return 'Đang hoạt động';
    } else if (status == 'UNACTIVE') {
      return 'Không hoạt động';
    } else if (status == 'BROKEN') {
      return 'Hỏng';
    } else if (status == 'FIXING') {
      return 'Sửa chữa';
    } else if (status == 'IDLE') {
      return 'Chờ sử dụng';
    } else if (status == 'DRAFT') {
      return 'Nháp';
    } else {
      return (statusData[status]?['label'] as String?) ?? 'Trống';
    }
  }

  Color getStatusColor(String status) {
    if (status == 'UNACTIVE') {
      return Color(0xFFE74C3C);
    } else {
      return (statusData[status]?['color'] as Color?) ?? Colors.black;
    }
  }

  Map<String, Map<String, dynamic>> statusData = {
    "ACTIVE": {
      "label": "Hoạt động",
      "color": Colors.green,
    },
    "INACTIVE": {
      "label": "Không hoạt động",
      "color": Colors.red,
    },
    "BROKEN": {
      "label": "Hỏng",
      "color": Colors.red,
    },
    "FIXING": {
      "label": "Sửa chữa",
      "color": Colors.yellow,
    },
    "IDLE": {
      "label": "Chờ sử dụng",
      "color": Colors.blue,
    },
    "DRAFT": {
      "label": "Nháp",
      "color": Colors.grey,
    },
    "UNACTIVE": {
      "label": "Không hoạt động",
      "color": Color(0xFFE74C3C),
    },
  };

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final checkImage = Uri.tryParse(widget.equipmentModel.imageUrls?.first ??
                'https://www.isosig.com/wp-content/uploads/2021/03/medical_devices2.jpg')
            ?.hasAbsolutePath ??
        false;
    var dateTime = DateTime.now();
    var dateTime2 = DateTime.now();
    try {
      dateTime = DateTime.parse(
        widget.equipmentModel.equipmentMaintainSchedule?.lastMaintainDate ??
            DateTime.now().toIso8601String(),
      );
      dateTime2 = DateTime.parse(
        widget.equipmentModel.endOfWarrantyDate ?? 'default_value_for_null',
      );
    } on Exception {
      print('ERROR');
      dateTime = DateTime.now();
    }
    final dateFormat = DateFormat('dd/MM/yyyy');
    final formattedDate = dateFormat.format(dateTime);
    final formattedDate2 = dateFormat.format(dateTime2);
    return Scaffold(
      floatingActionButton: backBtn(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: Container(
        width: double.infinity,
        decoration:
            BoxDecoration(color: const Color.fromARGB(255, 255, 255, 255)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
              ),
              items: (widget.equipmentModel.imageUrls?.isNotEmpty ?? false)
                  ? widget.equipmentModel.imageUrls!.map((imageURL) {
                      return SizedBox(
                        width: size.width,
                        height: size.height * 0.3,
                        child: Image.network(
                          imageURL,
                          fit: BoxFit.fill,
                        ),
                      );
                    }).toList()
                  : [
                      SizedBox(
                        width: size.width,
                        height: size.height * 0.3,
                        child: Image.network(
                          widget.equipmentModel.imageUrls?.first ??
                              'https://www.isosig.com/wp-content/uploads/2021/03/medical_devices2.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8, left: 12, bottom: 8),
              child: Text(
                'Chi tiết',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 100,
                          child: const Text(
                            'Tên máy',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            widget.equipmentModel.name ?? 'Trống',
                            softWrap: true,
                            style: const TextStyle(
                              color: Color(0xFF1A1A1A),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 100,
                          child: const Text(
                            'Mã máy',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            widget.equipmentModel.code ?? 'Trống',
                            softWrap: true,
                            style: const TextStyle(
                              color: Color(0xFF1A1A1A),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 100,
                          child: const Text(
                            'Nhãn hiệu',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            (widget.equipmentModel.brand?.name) ?? 'Trống',
                            softWrap: true,
                            style: const TextStyle(
                              color: Color(0xFF1A1A1A),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 100,
                          child: const Text(
                            'Loại thiết bị',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            (widget.equipmentModel.equipmentCategory?.name) ??
                                'Trống',
                            softWrap: true,
                            style: const TextStyle(
                              color: Color(0xFF1A1A1A),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 100,
                          child: const Text(
                            'Trạng thái',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            getStatusLabel(
                                widget.equipmentModel.currentStatus ??
                                    'DEFAULT'),
                            softWrap: true,
                            style: TextStyle(
                              color: getStatusColor(
                                  widget.equipmentModel.currentStatus ??
                                      'DEFAULT'),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 100,
                          child: Text(
                            'Mô tả',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Center(
                            child: Text(
                              widget.equipmentModel.description ?? 'Trống',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 7,
                              style: const TextStyle(
                                color: Color(0xFF1A1A1A),
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget backBtn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pop();
      },
      child: Neumorphic(
        style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
          depth: 5,
          color: Colors.grey,
          intensity: 1,
        ),
        child: Container(
          width: 36,
          height: 36,
          decoration: const ShapeDecoration(
            color: Color.fromARGB(255, 110, 194, 247),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 2, color: Color.fromARGB(255, 255, 255, 255)),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
          child: const Center(
            child: Icon(
              Icons.arrow_back,
              color: Color(0xFFE5E5E5),
            ),
          ),
        ),
      ),
    );
  }
}
