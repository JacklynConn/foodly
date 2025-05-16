import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/background_container.dart';
import 'package:foodly/common/reusable_text.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/constants/uidata.dart';
import 'package:foodly/views/categories/widgets/category_tile.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: ReusableText(
          text: "All Categories",
          fontSize: 12,
          color: kGray,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
      ),
      body: BackgroundContainer(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.only(left: 12.w, top: 10.h),
          height: height,
          width: width,
          child: ListView(
            physics: const BouncingScrollPhysics(),
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
