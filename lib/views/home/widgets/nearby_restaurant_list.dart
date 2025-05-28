import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/views/home/widgets/restaurant_tile.dart';
import '/views/home/widgets/restaurant_widget.dart';
import '../../../constants/uidata.dart';
import 'package:get/get.dart';

class NearbyRestaurantList extends StatelessWidget {
  const NearbyRestaurantList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 194.h,
      padding: EdgeInsets.only(left: 12.w),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(restaurants.length, (index) {
          var restaurant = restaurants[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: RestaurantWidget(
              image: '${restaurant['imageUrl']}',
              title: '${restaurant['title']}',
              logo: '${restaurant['logoUrl']}',
              time: '${restaurant['time']}',
              rating: '${restaurant['rating']}',
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
