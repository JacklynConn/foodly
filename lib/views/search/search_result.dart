import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/constants/constants.dart';
import '/models/food_model.dart';
import '/views/home/widgets/food_tile.dart';
import 'package:get/get.dart';
import '../../controllers/search_food_controller.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodController());
    return Container(
      padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.h, 0),
      height: height,
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.searchResults!.length,
        itemBuilder: (context, index) {
          FoodModel food = controller.searchResults![index];
          return FoodTile(food: food);
        },
      ),
    );
  }
}
