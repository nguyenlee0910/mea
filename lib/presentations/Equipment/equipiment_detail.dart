import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:mea/models/equipment_model.dart';

class EquipmentDetail extends StatefulWidget {
  const EquipmentDetail({required this.equipmentModel, super.key});
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
      return const Color(0xFFE74C3C);
    } else {
      return (statusData[status]?['color'] as Color?) ?? Colors.black;
    }
  }

  Map<String, Map<String, dynamic>> statusData = {
    'ACTIVE': {
      'label': 'Hoạt động',
      'color': Colors.green,
    },
    'INACTIVE': {
      'label': 'Không hoạt động',
      'color': Colors.red,
    },
    'BROKEN': {
      'label': 'Hỏng',
      'color': Colors.red,
    },
    'FIXING': {'label': 'Sửa chữa', 'color': Color.fromARGB(255, 31, 60, 190)},
    'IDLE': {
      'label': 'Chờ sử dụng',
      'color': Colors.blue,
    },
    'DRAFT': {
      'label': 'Nháp',
      'color': Colors.grey,
    },
    'UNACTIVE': {
      'label': 'Không hoạt động',
      'color': const Color(0xFFE74C3C),
    },
  };

  final PageController _pageController = PageController();
  int _selectedThumbnailIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final checkImage = Uri.tryParse(
          widget.equipmentModel.imageUrls?.first ??
              'https://www.isosig.com/wp-content/uploads/2021/03/medical_devices2.jpg',
        )?.hasAbsolutePath ??
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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 236, 236),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 110, 194, 247),
        title: const Text(
          'Chi tiết thiết bị',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: height * 0.27,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _selectedThumbnailIndex = index;
                    });
                  },
                  children:
                      (widget.equipmentModel.imageUrls?.isNotEmpty ?? false)
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
              ),
              const SizedBox(
                height: 3,
              ),
              SizedBox(
                height: height * 0.13,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      (widget.equipmentModel.imageUrls?.isNotEmpty ?? false)
                          ? widget.equipmentModel.imageUrls!.length
                          : 0,
                  itemBuilder: (context, index) {
                    return (widget.equipmentModel.imageUrls?.isNotEmpty ??
                            false)
                        ? Padding(
                            padding: const EdgeInsets.all(3),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedThumbnailIndex = index;
                                });
                                _pageController.animateToPage(
                                  index,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                                print('Show index $_selectedThumbnailIndex');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _selectedThumbnailIndex == index
                                        ? Colors
                                            .blue // Change the border color for the selected thumbnail
                                        : Colors.grey,
                                  ),
                                ),
                                child: SizedBox(
                                  width: size.width * 0.3,
                                  height: size.height * 0.3,
                                  child: Image.network(
                                    widget.equipmentModel.imageUrls![index],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : SizedBox(
                            width: size.width * 0.3,
                            height: size.height * 0.3,
                            child: Image.network(
                              widget.equipmentModel.imageUrls?.first ??
                                  'https://www.isosig.com/wp-content/uploads/2021/03/medical_devices2.jpg',
                              fit: BoxFit.fill,
                            ),
                          );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            left: 20,
                            top: 20,
                            bottom: 10,
                          ),
                          child: const Text(
                            'Chi tiết',
                            style: TextStyle(
                              color: Color.fromARGB(255, 110, 194, 247),
                              fontSize: 28,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, top: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 100,
                                child: Text(
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
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                width: 100,
                                child: Text(
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
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 100,
                                child: Text(
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
                                  widget.equipmentModel.brand?.name ?? 'Trống',
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
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 100,
                                child: Text(
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
                                  widget.equipmentModel.equipmentCategory
                                          ?.name ??
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
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 100,
                                child: Text(
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
                                        'DEFAULT',
                                  ),
                                  softWrap: true,
                                  style: TextStyle(
                                    color: getStatusColor(
                                      widget.equipmentModel.currentStatus ??
                                          'DEFAULT',
                                    ),
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
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 10),
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
                                    widget.equipmentModel.description ??
                                        'Trống',
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
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
