import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/app_style.dart';
import '../../../common/reusable_text.dart';
import '/constants/constants.dart';

class RestaurantWidget extends StatelessWidget {
  const RestaurantWidget({
    super.key,
    required this.image,
    required this.title,
    required this.logo,
    required this.time,
    required this.rating,
    this.onTap,
  });

  final String image;
  final String title;
  final String logo;
  final String time;
  final String rating;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width * 0.75,
        height: 200.h,
        decoration: BoxDecoration(
          color: kLightWhite,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.network(
                      image,
                      height: 112.h,
                      width: width * 0.8,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    top: 10.h,
                    right: 10.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.r),
                      child: Container(
                        padding: EdgeInsets.all(2.h),
                        height: 20.h,
                        width: 20.w,
                        color: kLightWhite,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.r),
                          child: Image.network(logo, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        text: title,
                        style: appStyle(12.sp, kDark, FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(
                        text: 'Delivery Time',
                        style: appStyle(9, kGray, FontWeight.w500),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: kSecondary,
                            size: 9.sp,
                          ),
                          SizedBox(width: 5.w),
                          ReusableText(
                            text: time,
                            style: appStyle(9, kDark, FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      RatingBarIndicator(
                        rating: double.parse(rating),
                        itemBuilder: (context, index) {
                          return Icon(
                            Icons.star,
                            color: kPrimary,
                          );
                        },
                        itemCount: 5,
                        itemSize: 14.sp,
                      ),
                      // Icon(Icons.star, color: kPrimary, size: 9.sp),
                      SizedBox(width: 10.w),
                      ReusableText(
                        text: rating,
                        style: appStyle(9, kGray, FontWeight.w500),
                      ),
                      SizedBox(width: 5.w),
                      Container(
                        height: 5.h,
                        width: 5.w,
                        decoration: BoxDecoration(
                          color: kGrayLight,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      ReusableText(
                        text: 'reviews and ratings',
                        style: appStyle(9, kGray, FontWeight.normal),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
