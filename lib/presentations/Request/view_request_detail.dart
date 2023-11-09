import 'package:flutter/material.dart';
import 'package:mea/models/base_request_model.dart';
import 'package:mea/models/import_request_model.dart';
import 'package:mea/presentations/Request/view_request.dart';

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
              buildImportRequestCell(
                  isDetail: true,
                  context: context,
                  requestModel: baseRequestModel),
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
                // baseRequestModel.note,
                '''Ta-go là nhà thơ hiện đại lớn nhất của Ấn Độ. Ông đã để lại một gia tài văn hoá nghệ thuật đồ sộ. Thơ Ta-go thể hiện tinh thần dân tộc và dân chủ sâu sắc, tính nhân văn và tính trữ tình triết lí nồng đượm. Bài thơ Mây và sóng in trong tập thơ Trăng non là một tuyệt tác, nó là bài ca về tình nhân ái, là ước mơ và khát vọng về tự do, hạnh phúc của con người. Bài thơ là lời của em bé nói với mẹ, là vẻ đẹp mộng mơ của trẻ thơ, là vẻ đẹp thiêng liêng của tình mẫu tử.

Mở đầu bài thơ là cụm từ mẹ con ngọt ngào, sâu lắng, nó mở ra một không gian tràn ngập tình yêu thương giữa con và mẹ. Hình ảnh người mẹ không xuất hiện trực tiếp trong thơ nhưng lại có mặt khắp không gian câu chuyện, có mặt trong lời gọi ngọt ngào và trong lời kể của con. Mẹ đang trân trọng lắng nghe lời con kể: trên my có người gọi con, đây là hình ảnh mộng mơ của con.

Có lẽ em bé đang ngước mắt nhìn bầu trời xanh trong, nhìn mây trắng nhởn nhơ bay trong vũ trụ bao la. Bé tưởng tượng mình sẽ lên được tận mây xanh để cùng mây chơi với bình minh vàng, chơi với vầng trăng bạc và để khám phá những điều kì diệu trên vũ trụ bao la. Cuộc sống trên mây thật hấp dẫn tuổi thơ nhưng em bé vẫn luôn nghĩ đến mẹ.

Cuộc đối thoại tưởng tượng giữa những người trên mây và em bé đã khẳng định tình mẫu tử thắm nồng. Hãy đến nơi tận cùng Trái đất, đưa tay lên trời, cậu sẽ được nhấc bổng lên tận tầng mây. Mẹ mình đang đợi ở nhà. Làm sao có thể rời mẹ mà đến được? Con yêu mẹ hiền nên không thể bỏ mẹ để lên đến tầng mây. Có hạnh phúc nào hơn sống bên mẹ của mình. Mặc dù trên mây thật lí tưởng. Tình yêu mẹ và ước mơ diệu kì vẫn song hành trong con: Con là mây, mẹ sẽ là trăng.

Hai bàn tay con ôm lấy mẹ và mái nhà ta sẽ là bầu trời xanh thắm. Sự lựa chọn của con thật cảm động. Con sẽ luôn gần mẹ. Con và mẹ gần nhau như mây với trăng, mây với bầu trời xanh thẳm. Trong suy nghĩ của con, mẹ là vầng trăng tỏa sáng, con là áng mây quanh quẩn bên trăng, gắn bó với trăng.

Tình mẫu tử thiêng liêng ấy càng biểu hiện sâu đậm hơn qua cuộc trò chuyện của em bé với những người trong sóng. Bọn tớ ca hát từ sáng sớm cho đến hoàng hôn. Bọn tớ ngao du nơi này nơi nọ mà không biết từng đến nơi nao. Nhưng làm thế nào mình ra ngoài đó được? Hãy đến rìa biển cả, nhắm nghiền mắt lại, cậu sẽ được sóng mang đi. Buổi chiều mẹ luôn muốn mình ở nhà, làm sao có thể rời mẹ mà đi được?

Cuộc đối thoại tưởng tượng của những người trong sóng và em bé đã khẳng định được tình mẹ con sâu đậm. Mặc cho những người trong sóng thủ thỉ cùng em về một cuộc viễn du, mặc cho sóng vẫy gọi chào mời, sóng vỗ rì rầm trên mặt biển thật là thích thú. Tuổi thơ nào mà không thích rong chơi đây đó? Mơ ước được đi xa, nhưng, bé lại băn khoăn vì mẹ muốn mình ở nhà.

Em không thể đi du ngoạn cùng mây và cũng không muốn đi chơi xa với sóng. Em mơ ước đến tận chân trời góc bể, mơ ước được khám phá những điều kì diệu trong chuyến đi chơi, nhưng em không thể nào rời mẹ. Với em, mẹ là nguồn vui nhất, nụ cười của mẹ là niềm vui của con. Tình mẹ con thiêng liêng đã làm cho bé ước mơ nhiều điều, liên tưởng đến những trò chơi kì diệu.

Con là sóng và mẹ là bến bờ kì lạ

Con lăn, Lăn mãi rồi sẽ cười vang vỡ tan vào lòng mẹ.

Và không ai trên thế gian này biết mẹ con ta ở chốn nào. Không có biển thì làm sao có sóng, cũng như không có mẹ thì làm sao có con.. Không có bến bờ thì sóng vỗ vào đâu, cũng như không có mẹ thì cuộc đời con có ý nghĩa gì. Lòng mẹ bao dung như bến bờ, luôn rộng mở. Hình ảnh bến bờ kì lạ để sóng lăn, lăn mãi rồi sẽ cười vỡ tan được ví như hình ảnh người mẹ luôn vỗ về, ôm ấp con thơ.

Mẹ mang đến hạnh phúc cho con, là chỗ dựa của cuộc đời con. Hình ảnh thiên nhiên giữa sóng và bến bờ, giữa mây và trăng là những hình ảnh tượng trưng, nó thể hiện tấm lòng bao dung của mẹ, nó diễn tả tình mẫu tử thiêng liêng bất diệt. Tình mẫu tử ấy không gì chia cắt được, đúng như câu khẳng định của con: Và không ai trên thế gian này biết mẹ con ta ở chốn nào.

Tình mẹ con trong câu thơ thật sâu đậm, đây là vẻ đẹp vĩnh hằng của tình mẫu tử. Dù thế gian có như thế nào chăng nữa nhưng tình mẹ con vẫn mãi mãi muôn đời, vẫn tồn tại theo thời gian, vẫn ẩn hiện trong không gian rộng lớn. Với hình thức đối thoại lồng độc thoại và cách sử dụng, những hình ảnh thiên nhiên giàu ý nghĩa tượng trưng, bài thơ Mây và sóng của Ta-go đã ngợi ca tình mẹ con thắm thiết, thiêng liêng và bất diệt. Nó là điểm tựa để con hướng tới tương lai tươi sáng, hướng tới những điều tốt đẹp trong” cuộc đời.''',
                //softWrap: true,
                // overflow: TextOverflow.ellipsis,
                maxLines: 100,
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
