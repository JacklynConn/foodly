import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/reusable_text.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/views/categories/category_page.dart';
import 'package:get/get.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.category,
  });

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
        radius: 18.r,
        backgroundColor: kGrayLight,
        backgroundImage: NetworkImage(category['imageUrl']),
      ),
      title: ReusableText(
        text: category['title'],
        fontSize: 14,
        color: kGray,
        fontWeight: FontWeight.normal,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 15.r,
        color: kGray,
      ),
    );
  }
}
