import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/constants/constants.dart';
import '../../../constants/uidata.dart';

class NearbyRestaurantListWidget extends StatelessWidget {
  const NearbyRestaurantListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210.h,
      padding: EdgeInsets.only(left: 12.w),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(restaurants.length, (index) {
          var restaurant = restaurants[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150.h,
              width: 300.w,
              color: kPrimary,
              child: Image.network('${restaurant['imageUrl']}', fit: BoxFit.cover),
            ),
          );
        }),
      ),
    );
  }
}
