import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/shimmers/nearby_shimmer.dart';
import '../../common/app_style.dart';
import '../../common/background_container.dart';
import '../../common/reusable_text.dart';
import '../../constants/constants.dart';
import '../../hooks/fetch_all_foods.dart';
import '../../models/food_model.dart';
import 'widgets/food_tile.dart';

class RecommendationsPage extends HookWidget {
  const RecommendationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllFoods('41007428');
    List<FoodModel>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;
    final error = hookResults.error;

    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        title: ReusableText(
          text: 'Recommendations',
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
                ? NearbyShimmer()
                : Padding(
                  padding: const EdgeInsets.all(12.0),
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
