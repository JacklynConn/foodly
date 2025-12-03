import 'package:foodly/models/additive_obs.dart';
import 'package:foodly/models/food_model.dart';
import 'package:get/get.dart';

class FoodsController extends GetxController {
  RxInt currentPage = 0.obs;
  bool initialCheckValue = false;
  var additiveList = <AdditiveObs>[].obs;

  void changPage(int index) {
    currentPage.value = index;
    // print(currentPage.value);
  }

  RxInt count = 1.obs;

  void increment() {
    count.value++;
  }

  void decrement() {
    if (count.value > 1) {
      count.value--;
    }
  }

  void loadAdditives(List<Additive> additives) {
    additiveList.clear();

    for (var additiveInfo in additives) {
      var additive = AdditiveObs(
        id: additiveInfo.id,
        title: additiveInfo.title,
        price: additiveInfo.price,
        isChecked: initialCheckValue,
      );
      if (additives.length == additiveList.length) {
      } else {
        additiveList.add(additive);
      }
    }
  }
}
