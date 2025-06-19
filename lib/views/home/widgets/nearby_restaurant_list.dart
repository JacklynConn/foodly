import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/shimmers/nearby_shimmer.dart';
import 'package:foodly/models/restaurants_model.dart';
import 'package:foodly/views/home/widgets/restaurant_tile.dart';
import '../../../hooks/fetch_restaurants.dart';
import '/views/home/widgets/restaurant_widget.dart';
import 'package:get/get.dart';

class NearbyRestaurantList extends HookWidget {
  const NearbyRestaurantList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchRestaurant('41007428');
    List<RestaurantsModel>? restaurants = hookResult.data;
    final isLoading = hookResult.isLoading;
    return isLoading
        ? NearbyShimmer()
        : Container(
          height: 194.h,
          padding: EdgeInsets.only(left: 12.w),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(restaurants!.length, (index) {
              var restaurant = restaurants[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: RestaurantWidget(
                  image: restaurant.imageUrl,
                  title: restaurant.title,
                  logo: restaurant.logoUrl,
                  time: restaurant.time,
                  rating: '${restaurant.rating}',
                  onTap: () {
                    Get.to(
                      () => RestaurantTile(restaurant: restaurant),
                      transition: Transition.cupertino,
                      duration: const Duration(milliseconds: 900),
                    );
                  },
                ),
              );
            }),
          ),
        );
  }
}
