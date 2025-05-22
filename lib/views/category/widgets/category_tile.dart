import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../common/app_style.dart';
import '../../../common/reusable_text.dart';
import '../../../constants/constants.dart';
import '../category_page.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({super.key, required this.category});

  final dynamic category;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(
          () => CategoryPage(),
          transition: Transition.fadeIn,
          duration: const Duration(milliseconds: 900),
        );
      },
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
  }
}
