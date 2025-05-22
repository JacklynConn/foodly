import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/views/category/widgets/category_tile.dart';
import '/common/background_container.dart';
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
      body: BackgroundContainer(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.only(left: 12.w, top: 10.h),
          height: height,
          child: ListView(
            children: List.generate(categories.length, (index) {
              var category = categories[index];
              return CategoryTile(category: category);
            }),
          ),
        ),
      ),
    );
  }
}
