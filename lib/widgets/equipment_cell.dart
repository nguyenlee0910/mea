import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class EquipmentCellData {
  EquipmentCellData({
    required this.name,
    required this.code,
    this.imageUrl,
    this.currentStatus,
    this.id,
  });
  String? id;
  String name;
  String code;
  String? imageUrl;
  String? currentStatus;
}

class EquipmentCell extends StatelessWidget {
  const EquipmentCell({
    required this.name,
    required this.code,
    this.id,
    this.imageUrl,
    this.currentStatus,
    this.buttonName = '',
    this.colorButtonName = Colors.grey, // Set a default color if needed
    this.onPress,
    super.key,
  });

  final String name;
  final String code;
  final String? imageUrl;
  final String? currentStatus;
  final String buttonName;
  final VoidCallback? onPress;
  final Color colorButtonName;
  final String? id;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        onPress?.call();
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Neumorphic(
            style: NeumorphicStyle(
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
              depth: 3,
              color: const Color.fromARGB(255, 255, 255, 255),
              intensity: 1,
            ),
            child: Container(
              width: size.width - 40,
              // height: 140,
              padding: const EdgeInsets.fromLTRB(8, 20, 8, 16),
              decoration: ShapeDecoration(
                color: const Color.fromARGB(255, 219, 236, 248),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 120,
                    height: 100,
                    child: Image.network(
                      imageUrl ??
                          'https://cdn.thuvienphapluat.vn/phap-luat/2022/202201/Tran/mua-ban-trang-thiet-bi-y-te-b-c-d.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 5),
                                child: SizedBox(
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
                                            color:
                                                Color.fromARGB(255, 21, 17, 17),
                                            fontSize: 16,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    softWrap: true,
                                    maxLines:
                                        2, // Đặt số dòng tối đa muốn hiển thị
                                    overflow: TextOverflow
                                        .ellipsis, // Đặt kiểu tràn nếu vượt quá số dòng tối đa
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
                                        text: 'Mã thiết bị: ',
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
                                        text: '$code\n',
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
                              const SizedBox(height: 10),
                              SizedBox(
                                width: 300,
                                height: 20,
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: 'Trạng thái: ',
                                        style: TextStyle(
                                          color: Color(0xFF1A1A1A),
                                          fontSize: 16,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                          height: 0,
                                        ),
                                      ),
                                      TextSpan(
                                        text: currentStatus == 'ACTIVE'
                                            ? 'Hoạt động'
                                            : currentStatus == 'FIXING'
                                                ? 'Đang sửa chữa'
                                                : currentStatus ?? 'Hoạt động',
                                        style: TextStyle(
                                          color: currentStatus == 'ACTIVE'
                                              ? Colors.green
                                              : currentStatus == 'FIXING'
                                                  ? Colors.blue
                                                  : Colors.green,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Inter',
                                          height: 0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                  // maxLines:
                                  //     2, // Đặt số dòng tối đa muốn hiển thị
                                  // overflow: TextOverflow
                                  //     .ellipsis, // Đặt kiểu tràn nếu vượt quá số dòng tối đa
                                ),
                              ),

                              // const SizedBox(height: 4),
                              // SizedBox(
                              //   width: 300,
                              //   height: 20,
                              //   child: Text.rich(
                              //     TextSpan(
                              //       children: [
                              //         const TextSpan(
                              //           text: 'Trạng thái: ',
                              //           style: TextStyle(
                              //             color: Color(0xFF1A1A1A),
                              //             fontSize: 16,
                              //             fontFamily: 'Inter',
                              //             fontWeight: FontWeight.w600,
                              //             height: 0,
                              //           ),
                              //         ),
                              //         TextSpan(
                              //           text: '$currentStatus\n',
                              //           style: const TextStyle(
                              //             color: Color(0xFF1A1A1A),
                              //             fontSize: 16,
                              //             fontWeight: FontWeight.w400,
                              //             fontFamily: 'Inter',
                              //             height: 0,
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                            ],
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
      ),
    );
  }
}
