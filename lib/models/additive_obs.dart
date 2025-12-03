import 'package:get/get.dart';

class AdditiveObs extends GetxController {
  final int id;
  final String title;
  final String price;
  RxBool isChecked = false.obs;

  AdditiveObs({
    required this.id,
    required this.title,
    required this.price,
    bool isChecked = false,
  }) {
    this.isChecked.value = isChecked;
  }

  void toggleChecked() {
    isChecked.value = !isChecked.value;
  }
}
