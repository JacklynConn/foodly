import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/common/shimmers/nearby_shimmer.dart';
import '/models/food_model.dart';
import '../../../hooks/fetch_foods.dart';
import '/views/home/widgets/food_widget.dart';

class FoodList extends HookWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchFoods('41007428');
    List<FoodModel>? foods = hookResult.data;
    final isLoading = hookResult.isLoading;

    return isLoading
        ? NearbyShimmer()
        : Container(
          height: 190.h,
          padding: EdgeInsets.only(left: 12.w),
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            children: List.generate(foods!.length, (index) {
              FoodModel food = foods[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: FoodWidget(
                  image: food.imageUrl[0],
                  title: food.title,
                  time: food.time,
                  price: food.price.toStringAsFixed(2),
                  onTap: () {
                    // Handle tap event
                  },
                ),
              );
            }),
          ),
        );
  }
}
