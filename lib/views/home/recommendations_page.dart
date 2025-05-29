import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/constants/uidata.dart';
import '../../common/app_style.dart';
import '../../common/background_container.dart';
import '../../common/reusable_text.dart';
import '../../constants/constants.dart';
import 'widgets/food_tile.dart';

class RecommendationsPage extends StatelessWidget {
  const RecommendationsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: List.generate(foods.length, (index) {
              var food = foods[index];
              return FoodTile(food: food);
            }),
          ),
        ),
      ),
    );
  }
}
