import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodly/common/app_style.dart';
import 'package:foodly/common/reusable_text.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/models/restaurants_model.dart';
import 'package:foodly/views/restaurant/widget/restaurant_bottom_bar.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

import 'directions_page.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key, this.restaurant});

  final RestaurantsModel? restaurant;

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kLightWhite,
        body: ListView(
          padding: .zero,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 230.h,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: widget.restaurant!.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  bottom: 0,
                  child: RestaurantBottomBar(widget: widget),
                ),

                Positioned(
                  top: 40.h,
                  right: 0,
                  left: 0,
                  child: Container(
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
                          text: widget.restaurant!.title,
                          style: appStyle(13, kDark, FontWeight.w600),
                        ),

                        GestureDetector(
                          onTap: () {
                            Get.to(() => const DirectionsPage());
                          },
                          child: Icon(
                            Ionicons.location,
                            color: kLightWhite,
                            size: 28.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
