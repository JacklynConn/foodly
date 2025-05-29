import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/background_container.dart';
import 'package:foodly/constants/uidata.dart';
import 'package:foodly/views/home/widgets/restaurant_tile.dart';
import '../../common/app_style.dart';
import '../../common/reusable_text.dart';
import '../../constants/constants.dart';

class AllNearbyRestaurants extends StatelessWidget {
  const AllNearbyRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: List.generate(restaurants.length, (index) {
              var restaurant = restaurants[index];
              return RestaurantTile(restaurant: restaurant);
            }),
          ),
        ),
      ),
    );
  }
}
