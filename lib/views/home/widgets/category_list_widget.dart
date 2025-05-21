import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/common/app_style.dart';
import '/common/reusable_text.dart';
import '/constants/constants.dart';
import '/constants/uidata.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(categories.length, (index) {
          var category = categories[index];
          return GestureDetector(
            onTap: () {
              // Handle category tap
              print('Tapped on ${category['title']}');
            },
            child: Container(
              margin: EdgeInsets.only(right: 5.w),
              padding: EdgeInsets.only(top: 4.h),
              width: width * 0.19,
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: kSecondary, width: .5.w),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 35.h,
                    child: Image.asset(
                      '${category['imageUrl']}',
                      fit: BoxFit.contain,
                    ),
                  ),
                  ReusableText(
                    text: category['title'],
                    style: appStyle(12, kDark, FontWeight.normal),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
