import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/custom_button.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/models/restaurants_model.dart';
import 'package:foodly/views/restaurant/rating_page.dart';
import 'package:foodly/views/restaurant/restaurant_page.dart';
import 'package:get/get.dart';

class RestaurantBottomBar extends StatelessWidget {
  const RestaurantBottomBar({super.key, required this.restaurant});

  final RestaurantsModel? restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .symmetric(horizontal: 8.w),
      width: width,
      height: 40.h,
      decoration: BoxDecoration(
        color: kPrimary.withOpacity(0.4),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.r),
          topRight: Radius.circular(8.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          RatingBarIndicator(
            itemCount: 5,
            itemSize: 20.h,
            direction: Axis.horizontal,
            rating: restaurant!.rating.toDouble(),
            itemBuilder: (context, index) =>
                const Icon(Icons.star, color: Colors.yellow),
          ),

          CustomButton(
            onTap: () {
              Get.to(() => const RatingPage());
            },
            text: 'Rate Restaurant',
            btnWidth: width / 3,
            color: kSecondary,
          ),
        ],
      ),
    );
  }
}
