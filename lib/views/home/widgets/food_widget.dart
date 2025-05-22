import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/app_style.dart';
import '../../../common/reusable_text.dart';
import '../../../constants/constants.dart';

class FoodWidget extends StatelessWidget {
  const FoodWidget({
    super.key,
    required this.image,
    required this.title,
    required this.time,
    required this.price,
    this.onTap,
  });

  final String image;
  final String title;
  final String time;
  final String price;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width * 0.75,
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
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(
                        text: title,
                        style: appStyle(12.sp, kDark, FontWeight.w500),
                      ),
                      ReusableText(
                        text: '\$ $price',
                        style: appStyle(12.sp, kPrimary, FontWeight.w500),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
