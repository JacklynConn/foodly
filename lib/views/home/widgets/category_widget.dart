import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/reusable_text.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/controllers/category_controller.dart';
import 'package:foodly/views/categories/all_categories.dart';
import 'package:get/get.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.category});

  final dynamic category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return GestureDetector(
      onTap: () {
        if (controller.categoryValue == category['_id']) {
          controller.updateCategory = '';
          controller.updateTitle = '';
        } else if (category['value'] == 'more') {
          Get.to(
            () => AllCategories(),
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 900),
          );
        } else {
          controller.updateCategory = category['_id'];
          controller.updateTitle = category['title'];
        }
      },
      child: Obx(
        () => Container(
          margin: EdgeInsets.only(right: 5.w),
          padding: EdgeInsets.all(4.w),
          width: width * 0.19,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color:
                  controller.categoryValue == category['_id']
                      ? kSecondary
                      : kWhite,
              width: .5.w,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 35.h,
                child: Image.network(category['imageUrl'], fit: BoxFit.contain),
              ),
              ReusableText(
                text: category['title'],
                fontSize: 12,
                color: kDark,
                fontWeight: FontWeight.normal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
