import 'package:get/get.dart';

class FoodsController extends GetxController{

  RxInt currentPage = 0.obs;

  void changPage(int index){
    currentPage.value = index;
    // print(currentPage.value);
  }
}