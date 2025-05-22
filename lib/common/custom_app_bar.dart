import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../common/app_style.dart';
import '../common/reusable_text.dart';
import '../constants/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 6.0.h),
      width: width,
      height: 110.h,
      color: kOffWhite,
      child: Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 22.r,
                  backgroundColor: kSecondary,
                  backgroundImage: NetworkImage(
                    'https://th.bing.com/th/id/OIP.kN8tEO6_wPf1PMEofLrdTgHaGh?rs=1&pid=ImgDetMain',
                  ),
                ),
                SizedBox(width: 10.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      text: "Delivering to",
                      style: appStyle(13, kSecondary, FontWeight.w600),
                    ),
                    SizedBox(
                      width: width * 0.65,
                      child: Text(
                        "16768 21st Ave N, Plymouth, MN 55447",
                        overflow: TextOverflow.ellipsis,
                        style: appStyle(11, kGrayLight, FontWeight.normal),
                      ),
                    ),

                  ],
                ),
              ],
            ),
            Text(
              getTimeOfDay(),
              style: TextStyle(
                fontSize: 25.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getTimeOfDay(){
    DateTime now = DateTime.now();
    int hour = now.hour;

    if (hour >= 0 && hour < 12) {
      return ' ☀️ ';
    } else if (hour >= 12 && hour < 16) {
      return ' ⛅ ';
    } else {
      return ' 🌙 ';
    }
  }
}
