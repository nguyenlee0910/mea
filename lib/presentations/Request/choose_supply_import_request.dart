import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:mea/models/supply_model.dart';
import 'package:mea/services/department_api.dart';
import 'package:mea/viewModels/import_items_viewModels.dart';
import 'package:stacked/stacked.dart';

// ignore: must_be_immutable
class ListSupplyPage extends StatefulWidget {
  ListSupplyPage({
    required this.listImportRequestDevice,
    super.key,
  });
  static String routeName = 'choose_supply';
  ListImportRequestDevice listImportRequestDevice = ListImportRequestDevice();

  @override
  State<ListSupplyPage> createState() => _ListSupplyPageState();
}

class _ListSupplyPageState extends State<ListSupplyPage> {
  List<SupplyModel> listSupply = [];
  List<SupplyModel> filterListSupply = [];
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ImportRequestItemViewModel>.reactive(
      viewModelBuilder: ImportRequestItemViewModel.new,
      onViewModelReady: (viewModel) async {
        await viewModel.getData().then((value) {
          if (widget.listImportRequestDevice.data.isNotEmpty) {
            viewModel.setDataFromParent(widget.listImportRequestDevice.data);
          }
        });
      },
      disposeViewModel: true,
      builder: (context, viewModel, child) => Scaffold(
        appBar: EasySearchBar(
          isFloating: true,
          title: const Text('Tìm vật tư'),
          onSearch: (value) {
            Future.microtask(() {
              viewModel.setSearchValue(value);
            });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Visibility(
          visible: viewModel.isIncrese(),
          child: Container(
            height: 50,
            margin: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                final list = List<ImportRequestItems>.from(
                  viewModel.data
                      .where((element) => element.quantity != 0)
                      .toList(),
                );
                widget.listImportRequestDevice.setData(list);
                viewModel.dispose();

                context.pop();
              },
              child: const Center(
                child: Text('Cofirm'),
              ),
            ),
          ),
        ),
        body: viewModel.isBusy
            ? const Center(child: CircularProgressIndicator())
            : buildCell(context, viewModel),
      ),
    );
  }

  Widget buildCell(
    BuildContext context,
    ImportRequestItemViewModel viewModel,
  ) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<ImportRequestItemViewModel>.reactive(
        viewModelBuilder: () => viewModel,
        builder: (context, viewModel, child) {
          final data = viewModel.filterData.isEmpty
              ? viewModel.data
              : viewModel.filterData;
          return GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            crossAxisCount: 2,
            children: data.map((supplyItems) {
              return Column(
                children: [
                  Expanded(
                    child: SizedBox.square(
                      dimension: size.width * 0.35,
                      child: Stack(
                        children: [
                          Neumorphic(
                            style: NeumorphicStyle(
                              boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(20),
                              ),
                              depth: 5,
                              color: Colors.grey,
                              intensity: 1,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                supplyItems.imageURL,
                                fit: BoxFit.fill,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          if (supplyItems.quantity == 0) ...[
                            IconButton(
                              icon: Icon(
                                Icons.add_circle,
                                color: Colors.green,
                              ),
                              onPressed: () {
                                Future.microtask(() {
                                  viewModel.setQuantity(
                                    1,
                                    supplyItems.supplyId,
                                  );
                                });
                              },
                            )
                          ] else ...[
                            SizedBox(
                              width: size.width * 0.25,
                              height: size.width * 0.12,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: InputQty(
                                  maxVal: 5,
                                  isIntrinsicWidth: false,
                                  showMessageLimit: false,
                                  initVal: supplyItems.quantity,
                                  onQtyChanged: (val) {
                                    Future.microtask(() {
                                      viewModel.setQuantity(
                                        val as int,
                                        supplyItems.supplyId,
                                      );
                                    });
                                  },
                                  plusBtn: Icon(
                                    Icons.add_circle,
                                    color: viewModel.getQuantity(
                                                supplyItems.supplyId) !=
                                            5
                                        ? Colors.green
                                        : Colors.grey,
                                    size: 18,
                                  ),
                                  minusBtn: Icon(
                                    Icons.remove_circle,
                                    color: Colors.green,
                                    size: 18,
                                  ),
                                  borderShape: BorderShapeBtn.none,
                                  boxDecoration: BoxDecoration(
                                      border: Border.all(width: 0),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      )),
                                ),
                              ),
                            ),
                          ]
                        ],
                      ),
                    ),
                  ),
                  const Gap(16),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      supplyItems.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              );
            }).toList(),
          );
        });
  }
}
