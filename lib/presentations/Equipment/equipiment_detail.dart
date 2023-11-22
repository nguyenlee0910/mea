import 'dart:async';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mea/models/equipment_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final checkImage =
        Uri.tryParse(widget.equipmentModel.imageUrls?.first ?? '')
                ?.hasAbsolutePath ??
            false;
    var dateTime = DateTime.now();
    var dateTime2 = DateTime.now();
    try {
      dateTime = DateTime.parse(
        widget.equipmentModel.equipmentMaintainSchedule?.lastMaintainDate ??
            DateTime.now().toIso8601String(),
      );
      DateTime dateTime2 = DateTime.parse(
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
        decoration: BoxDecoration(color: Colors.grey[100]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                //aspectRatio: 16 / 9, // Adjust the aspect ratio as needed
                enlargeCenterPage: true,
                enableInfiniteScroll:
                    true, // Set this to true if you want infinite scrolling
              ),
              items: widget.equipmentModel.imageUrls?.map((imageURL) {
                    return SizedBox(
                      width: size.width,
                      height: size.height * 0.3,
                      child: Image.network(
                        imageURL,
                        fit: BoxFit.fill,
                      ),
                    );
                  })?.toList() ??
                  [],
            ),

            // SizedBox(
            //   width: size.width,
            //   height: size.height * 0.3,
            //   child: DecoratedBox(
            //     decoration: BoxDecoration(color: Colors.grey[100]),
            //     child: Image(
            //       fit: BoxFit.fill,
            //       image: checkImage
            //           ? NetworkImage(widget.equipmentModel.imageUrls[0])
            //           : const NetworkImage(
            //               'https://monkeymedia.vcdn.com.vn/upload/web/img/tieng-viet-lop-4-cau-hoi-va-dau-cham-hoi-01a.png',
            //             ),
            //     ),
            //   ),
            // ),
            const Padding(
              padding: EdgeInsets.only(top: 8, left: 12, bottom: 8),
              child: Text(
                'Chi tiết',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Center(
              child: Neumorphic(
                style: NeumorphicStyle(
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  depth: 5,
                  color: Colors.grey,
                  intensity: 1,
                ),
                child: Container(
                  width: 380,
                  height: 380,
                  padding: const EdgeInsets.all(20),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 120,
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
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 120,
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
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 120,
                            child: const Text(
                              'Ngày bảo trì\ngần nhất',
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
                              formattedDate,
                              softWrap: true,
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
                      const SizedBox(height: 16),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 120,
                            child: const Text(
                              'Ngày hết hạn\nbảo trì',
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
                              formattedDate2,
                              softWrap: true,
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
                      const SizedBox(height: 16),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 120,
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
                            child: Text(
                              widget.equipmentModel.description ?? 'Trống',
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
                        ],
                      ),
                    ],
                  ),
                ),
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
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 2, color: Color(0xFFE5E5E5)),
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
