import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/views/home/widgets/food_list.dart';
import '/views/home/widgets/nearby_restaurant_list.dart';
import '/views/home/all_fastest_foods_page.dart';
import '/views/home/recommendations_page.dart';
import '../../common/heading.dart';
import 'all_nearby_restaurants.dart';
import 'widgets/category_list_widget.dart';
import '/common/custom_app_bar.dart';
import '/common/custom_container.dart';
import '/constants/constants.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.h),
        child: CustomAppBar(),
      ),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Column(
            children: [
              CategoryListWidget(),
              Heading(
                text: "Nearby Restaurants",
                onTap: () {
                  Get.to(
                    () => AllNearbyRestaurants(),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 900),
                  );
                },
              ),
              NearbyRestaurantList(),
              Heading(
                text: "Try Something New",
                onTap: () {
                  Get.to(
                    () => RecommendationsPage(),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 900),
                  );
                },
              ),
              FoodList(),
              Heading(
                text: "Food Closer to You",
                onTap: () {
                  Get.to(
                    () => AllFastestFoodsPage(),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 900),
                  );
                },
              ),
              FoodList(),
            ],
          ),
        ),
      ),
    );
  }
}
