import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
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
        onSearch: (value) => setState(() {}),
        actions: [IconButton(icon: const Icon(Icons.person), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
