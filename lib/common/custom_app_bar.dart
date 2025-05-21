import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/app_style.dart';
import 'package:foodly/common/reusable_text.dart';
import 'package:foodly/constants/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      width: width,
      height: 110.h,
      padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 6.0.h),
      color: kOffWhite,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 23.r,
                backgroundColor: kSecondary,
                backgroundImage: NetworkImage(
                  'https://th.bing.com/th/id/OIP.kN8tEO6_wPf1PMEofLrdTgHaGh?rs=1&pid=ImgDetMain',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 6.h, left: 8.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      text: "Deliver to",
                      style: appStyle(13, kSecondary, FontWeight.w600),
                    ),
                    SizedBox(
                      width: width * 0.65,
                      child: Text(
                        "16768 2nd St, New York",
                        overflow: TextOverflow.ellipsis,
                        style: appStyle(11, kGrayLight, FontWeight.normal),
                      ),
                    ),

                  ],
                ),
              ),
              Text(
                '❄️',
                style: TextStyle(
                  fontSize: 11.sp,
                  color: kGrayLight,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
