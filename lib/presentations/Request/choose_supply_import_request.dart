import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:gap/gap.dart';
import 'package:mea/models/supply_model.dart';
import 'package:mea/services/department_api.dart';

class ListSupplyPage extends StatefulWidget {
  const ListSupplyPage({super.key});
  static String routeName = 'choose_supply';

  @override
  State<ListSupplyPage> createState() => _ListSupplyPageState();
}

class _ListSupplyPageState extends State<ListSupplyPage> {
  List<SupplyModel> listSupply = [];
  List<SupplyModel> filterListSupply = [];
  TextEditingController textController = TextEditingController();

  Future<void> getListSupply() async {
    await DepartmentServices.getSupply().then((value) {
      setState(() {
        listSupply = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getListSupply();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EasySearchBar(
          isFloating: true,
          title: const Text('Example'),
          onSearch: (value) => setState(() {
            ;
          }),
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 2,
          children: listSupply.map(
            (e) {
              return buildCell(context, e);
            },
          ).toList(),
        ));
  }

  Widget buildCell(BuildContext context, SupplyModel supplyModel) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
          child: SizedBox.square(
            dimension: size.width * 0.35,
            child: Stack(
              children: [
                Neumorphic(
                  style: NeumorphicStyle(
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
                    depth: 5,
                    color: Colors.grey,
                    intensity: 1,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      supplyModel.imageUrls!.first,
                      fit: BoxFit.fill,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.add_circle,
                    color: Colors.green,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
        const Gap(16),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            supplyModel.name!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
