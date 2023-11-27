import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class EquipmentImportRequestCellData {
  EquipmentImportRequestCellData({
    required this.name,
    required this.quantity,
    required this.unit,
  });
  String name;
  String unit;
  int quantity;
}

class EquipmentImportRequestCell extends StatelessWidget {
  const EquipmentImportRequestCell(
      {required this.name,
      required this.quantity,
      required this.unit,
      super.key});
  final String name;
  final String unit;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Neumorphic(
        style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
          depth: 6,
          color: Colors.grey,
          intensity: 1,
        ),
        child: Container(
          height: size.height * 0.2,
          padding: const EdgeInsets.all(16),
          decoration: ShapeDecoration(
            color: const Color.fromARGB(255, 219, 236, 248),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 300,
                          height:
                              40, // Tăng giá trị này nếu bạn muốn hiển thị nhiều dòng hơn
                          child: Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Tên thiết bị: ',
                                  style: TextStyle(
                                    color: Color(0xFF1A1A1A),
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: name,
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 21, 17, 17),
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                            softWrap: true,
                            maxLines: 2, // Đặt số dòng tối đa muốn hiển thị
                            overflow: TextOverflow
                                .ellipsis, // Đặt kiểu tràn nếu vượt quá số dòng tối đa
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: 300,
                      height: 20,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Loại thiết bị: ',
                              style: TextStyle(
                                color: Color(0xFF1A1A1A),
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              // text: '$code\n',
                              text: unit,
                              style: const TextStyle(
                                color: Color(0xFF1A1A1A),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Inter',
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: 300,
                      height: 20,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Số lượng: ',
                              style: TextStyle(
                                color: Color(0xFF1A1A1A),
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              // text: '$code\n',
                              text: quantity.toString(),
                              style: const TextStyle(
                                color: Color(0xFF1A1A1A),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Inter',
                                height: 0,
                              ),
                            ),
                          ],
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
    );
  }
}
