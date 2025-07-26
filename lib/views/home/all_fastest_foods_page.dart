import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/shimmers/foodlist_shimmer.dart';
import 'package:foodly/constants/uidata.dart';
import 'package:foodly/views/home/widgets/food_tile.dart';
import '../../common/background_container.dart';
import '../../hooks/fetch_all_foods.dart';
import '../../models/food_model.dart';
import '/common/app_style.dart';
import '/common/reusable_text.dart';
import '../../constants/constants.dart';

class AllFastestFoodsPage extends HookWidget {
  const AllFastestFoodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchAllFoods('41007428');
    List<FoodModel>? foods = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;

    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        title: ReusableText(
          text: 'Fastest Foods',
          style: appStyle(13.sp, kLightWhite, FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: kSecondary,
        elevation: 0,
      ),
      body: BackgroundContainer(
        color: Colors.white,
        child:
            isLoading
                ? FoodsListShimmer()
                : Padding(
                  padding: EdgeInsets.all(12.h),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: List.generate(foods!.length, (index) {
                      var food = foods[index];
                      return FoodTile(food: food);
                    }),
                  ),
                ),
      ),
    );
  }
}
