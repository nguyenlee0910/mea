import 'package:flutter/material.dart';
import 'package:mea/models/base_request_model.dart';
import 'package:mea/models/import_request_model.dart';

class ViewRequestDetail extends StatelessWidget {
  const ViewRequestDetail({super.key, required this.baseRequestModel});

  static const routeName = 'view_request_detail';
  final BaseRequestModel baseRequestModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          baseRequestModel is ImportRequestModel
              ? 'Đơn yêu cầu thiết bị'
              : "Đơn yêu cầu sửa chữa thiết bị",
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
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Lí do',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
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
              const SizedBox(height: 20),
              Text(
                'Chú thích',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                baseRequestModel.note,
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
            ],
          ),
        ),
      ),
    );
  }
}
