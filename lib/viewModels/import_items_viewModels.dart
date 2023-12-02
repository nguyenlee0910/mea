import 'package:mea/models/supply_model.dart';
import 'package:stacked/stacked.dart';

import '../services/department_api.dart';

class ImportRequestItems {
  ImportRequestItems({
    required this.quantity,
    required this.supplyId,
    required this.imageURL,
    required this.name,
  });
  int quantity;
  String supplyId;
  String name;
  String imageURL;
}

class ImportRequestItemViewModel extends BaseViewModel {
  List<ImportRequestItems> data = [];
  bool isIncreaseAny = false;

  Future<void> getData() async {
    await runBusyFuture<List<SupplyModel>>(DepartmentServices.getSupply())
        .then((value) {
      data.addAll(
        value.map(
          (e) {
            return ImportRequestItems(
              quantity: 0,
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
    return data.where((element) => element.supplyId == id).first.quantity;
  }

  // ignore: use_setters_to_change_properties
  void setQuantity(int value, String id) {
    data.where((element) => element.supplyId == id).first.quantity = value;
    notifyListeners();
  }

  void increaseByOne(String id) {
    data.where((element) => element.supplyId == id).first.quantity += 1;
  }

  bool isIncrese() {
    return data.where((element) => element.quantity != 0).isNotEmpty;
  }
}
