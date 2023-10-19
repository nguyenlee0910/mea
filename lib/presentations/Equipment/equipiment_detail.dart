import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mea/constants.dart';

class EquipmentDetail extends StatefulWidget {
  const EquipmentDetail({super.key});
  static const routeName = 'equipment_detail';

  @override
  State<EquipmentDetail> createState() => _EquipmentDetailState();
}

class _EquipmentDetailState extends State<EquipmentDetail> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: backBtn(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.instance.backgroundTheme),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: size.width,
              height: size.height * 0.3,
              child: const DecoratedBox(
                decoration: const BoxDecoration(color: Colors.red),
                child: Image(
                  image: NetworkImage(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                ),
              ),
            ),
            const Padding(
              padding: const EdgeInsets.only(top: 8, left: 12, bottom: 8),
              child: Text(
                "Chi tiết",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Center(
              child: Container(
                width: size.width * 0.8,
                height: size.height * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0x6683edac),
                ),
                child: const Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Ten thiet bi: ' +
                        'May tinh 01\n' +
                        'Ma thiet bi: ' +
                        'MM01\n' +
                        'Mo ta: ' +
                        'May tinh sieu nang ... ... ...',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
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
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Center(
          child: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(168, 0, 187, 165),
          ),
        ),
      ),
    );
  }
}
