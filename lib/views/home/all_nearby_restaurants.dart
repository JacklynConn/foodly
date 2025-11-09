import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/common/background_container.dart';
import '/common/shimmers/foodlist_shimmer.dart';
import '/views/home/widgets/restaurant_tile.dart';
import '../../common/app_style.dart';
import '../../common/reusable_text.dart';
import '../../constants/constants.dart';
import '../../hooks/fetch_restaurants.dart';
import '../../models/restaurants_model.dart';

class AllNearbyRestaurants extends HookWidget {
  const AllNearbyRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchRestaurants('41007428');
    List<RestaurantsModel>? restaurants = hookResult.data;
    final isLoading = hookResult.isLoading;

    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        title: ReusableText(
          text: 'Nearby Restaurants',
          style: appStyle(13.sp, kLightWhite, FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: kSecondary,
        elevation: 0,
      ),
      body: BackgroundContainer(
        color: Colors.white,
        child: isLoading
            ? FoodsListShimmer()
            : Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: List.generate(restaurants!.length, (index) {
                    var restaurant = restaurants[index];
                      return RestaurantTile(restaurant: restaurant);
                    }),
                  ),
                ),
      ),
    );
  }
}
