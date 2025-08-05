import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/views/home/widgets/food_tile.dart';
import '../../../common/shimmers/foodlist_shimmer.dart';
import '../../../hooks/fetch_all_foods.dart';
import '../../../models/food_model.dart';

class CategoryFoodsList extends HookWidget {
  const CategoryFoodsList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchAllFoods('41007428');
    List<FoodModel>? foods = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;

    return SizedBox(
      height: height,
      width: width,
      child:
          isLoading
              ? FoodsListShimmer()
              : Padding(
                padding: EdgeInsets.all(12.h),
                child: ListView(
                  shrinkWrap: true,
                  children: List.generate(foods!.length, (index) {
                    var food = foods[index];
                    return FoodTile(food: food);
                  }),
                ),
              ),
    );
  }
}
