import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controllers/category_controller.dart';
import '../../category/all_categories.dart';
import '/common/app_style.dart';
import '/common/reusable_text.dart';
import '/constants/constants.dart';

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
            () => const AllCategories(),
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 900),
          );
        } else {
          controller.updateCategory = category['_id'];
          controller.updateTitle = category['title'];
        }
      },
      child: Obx(() {
        return Container(
          margin: EdgeInsets.only(right: 5.w),
          padding: EdgeInsets.only(top: 4.h),
          width: width * 0.19,
          decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color:
                  controller.categoryValue == category['_id']
                      ? kSecondary
                      : kOffWhite,
              width: 0.5.w,
            ),
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
        );
      }),
    );
  }
}
