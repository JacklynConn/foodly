import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodly/common/app_style.dart';
import 'package:foodly/common/reusable_text.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/views/restaurant/directions_page.dart';
import 'package:get/get.dart';
import '../../../models/restaurants_model.dart';

class RestaurantTopBar extends StatelessWidget {
  const RestaurantTopBar({super.key, required this.restaurant});

  final RestaurantsModel? restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .symmetric(horizontal: 12.w),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        crossAxisAlignment: .center,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Ionicons.chevron_back_circle,
              color: kLightWhite,
              size: 28.sp,
            ),
          ),

          ReusableText(
            text: restaurant!.title,
            style: appStyle(13, kDark, FontWeight.w600),
          ),

          GestureDetector(
            onTap: () {
              Get.to(() => const DirectionsPage());
            },
            child: Icon(Ionicons.location, color: kLightWhite, size: 28.sp),
          ),
        ],
      ),
    );
  }
}
