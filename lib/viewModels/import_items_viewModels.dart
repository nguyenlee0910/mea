import 'package:flutter/material.dart';
import 'package:mea/models/supply_model.dart';
import 'package:stacked/stacked.dart';

import '../services/department_api.dart';

class ImportRequestItems {
  ImportRequestItems({
    required this.quantityImport,
    required this.supplyId,
    required this.imageURL,
    required this.name,
    required this.quantity,
  });
  int quantityImport;
  String supplyId;
  String name;
  String imageURL;
  int quantity;
}

class ListImportRequestDevice extends ChangeNotifier {
  List<ImportRequestItems> data = [];
  void setData(List<ImportRequestItems> value) {
    data = value;
    notifyListeners();
  }
}

class ImportRequestItemViewModel extends BaseViewModel {
  List<ImportRequestItems> data = [];
  List<ImportRequestItems> filterData = [];
  bool isIncreaseAny = false;
  String searchValue = '';

  Future<void> getData() async {
    await runBusyFuture<List<SupplyModel>>(DepartmentServices.getSupply())
        .then((value) {
      data.addAll(
        value.map(
          (e) {
            return ImportRequestItems(
              quantity: e.quantity!,
              quantityImport: 0,
              name: e.name!,
              supplyId: e.id!,
              imageURL: e.imageUrls!.first,
            );
          },
        ),
      );
    });
  }

  int getQuantity(String id) {
    return data.where((element) => element.supplyId == id).first.quantityImport;
  }

  // ignore: use_setters_to_change_properties
  void setQuantity(int value, String id) {
    data.where((element) => element.supplyId == id).first.quantityImport =
        value;
    notifyListeners();
  }

  void increaseByOne(String id) {
    data.where((element) => element.supplyId == id).first.quantityImport += 1;
  }

  bool isIncrese() {
    return data.where((element) => element.quantityImport != 0).isNotEmpty;
  }

  void setDataFromParent(List<ImportRequestItems> value) {
    for (final ele in value) {
      data
          .where((element) => element.supplyId == ele.supplyId)
          .first
          .quantityImport = ele.quantityImport;
    }
    notifyListeners();
  }

  void _filterData() {
    if (searchValue.isNotEmpty) {
      filterData = data
          .where(
            (element) => element.name.toLowerCase().contains(
                  searchValue.toLowerCase(),
                ),
          )
          .toList();
    } else {
      filterData = data;
    }
  }

  void setSearchValue(String value) {
    searchValue = value;
    _filterData();
    notifyListeners();
  }
}
