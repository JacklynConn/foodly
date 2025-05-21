import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/uidata.dart';
import '/common/app_style.dart';
import '/common/reusable_text.dart';
import '/constants/constants.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ReusableText(
          text: 'All Categories',
          style: appStyle(12, kGray, FontWeight.w600),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: kOffWhite,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 12.w, top: 10.h),
        height: height,
        child: ListView(
          children: List.generate(categories.length, (index) {
            var category = categories[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: kGrayLight,
                radius: 18.r,
                child: Image.asset(category['imageUrl'], fit: BoxFit.contain),
              ),
              title: ReusableText(
                text: category['title'],
                style: appStyle(12, kDark, FontWeight.normal),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: kGray,
                size: 15.sp,
              ),
            );
          }),
        ),
      ),
    );
  }
}
