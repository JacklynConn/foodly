import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/constants/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 14.w, right: 14.w),
      color: kOffWhite,
      width: width,
      height: 110.h,
      child: Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 22.r,
                      backgroundImage: NetworkImage(
                        'https://th.bing.com/th/id/OIP.kN8tEO6_wPf1PMEofLrdTgHaGh?rs=1&pid=ImgDetMain',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.w, bottom: 6.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Deliver to',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: kSecondary,
                            ),
                          ),
                          SizedBox(
                            width: width * 0.65,
                            child: Text(
                              '1234 Main Street, City, State',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.normal,
                                color: kGrayLight,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(getTimeOfDay(), style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }

  String getTimeOfDay() {
    DateTime now = DateTime.now();
    int hour = now.hour;

    if (hour >= 0 && hour < 12) {
      return ' ☀️ ';
    } else if (hour >= 12 && hour < 16) {
      return ' ⛅ ';
    } else {
      return '🌙 ';
    }
  }
}
