import 'package:get/get.dart';

class FoodsController extends GetxController{

  RxInt currentPage = 0.obs;

  void changPage(int index){
    currentPage.value = index;
    // print(currentPage.value);
  }

  RxInt count = 1.obs;

  void increment(){
    count.value++;
  }

  void decrement(){
    if(count.value > 1){
      count.value--;
    }
  }
}