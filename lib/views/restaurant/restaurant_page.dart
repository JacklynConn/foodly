import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/app_style.dart';
import 'package:foodly/common/reusable_text.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/models/restaurants_model.dart';
import 'package:foodly/views/restaurant/widget/restaurant_bottom_bar.dart';
import 'package:foodly/views/restaurant/widget/restaurant_top_bar.dart';

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
                  child: RestaurantBottomBar(restaurant: widget.restaurant),
                ),

                Positioned(
                  top: 40.h,
                  right: 0,
                  left: 0,
                  child: RestaurantTopBar(restaurant: widget.restaurant),
                ),
              ],
            ),

            SizedBox(height: 10.h),

            Padding(
              padding: .symmetric(horizontal: 8.w),
              child: Column(
                children: [
                  RowText(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RowText extends StatelessWidget {
  const RowText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ReusableText(
              text: 'Distance To Restaurant',
              style: appStyle(10, kGray, FontWeight.w500),
            ),
    
            ReusableText(
              text: '2.7 km',
              style: appStyle(10, kGray, FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
