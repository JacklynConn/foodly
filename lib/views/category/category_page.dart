import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/reusable_text.dart';
import 'package:get/get.dart';
import '../../common/app_style.dart';
import '../../common/background_container.dart';
import '../../common/shimmers/foodlist_shimmer.dart';
import '../../controllers/category_controller.dart';
import '../../hooks/fetch_category_foods.dart';
import '../../models/food_model.dart';
import '../home/widgets/food_tile.dart';
import '/constants/constants.dart';

class CategoryPage extends HookWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    final hookResult = useFetchFoodsByCategory('41007428');
    List<FoodModel>? foods = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;

    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => ReusableText(
            text: controller.titleValue,
            style: appStyle(13, kGray, FontWeight.w600),
          ),
        ),
        centerTitle: true,
        backgroundColor: kOffWhite,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            controller.updateCategory = '';
            controller.updateTitle = '';
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_rounded, color: kDark),
        ),
      ),
      body: BackgroundContainer(
        color: Colors.white,
        child: SizedBox(
          height: height,
          child:
              isLoading
                  ? FoodsListShimmer()
                  : Padding(
                    padding: EdgeInsets.all(12.h),
                    child: ListView(
                      shrinkWrap: true,
                      children: List.generate(foods!.length, (index) {
                        var food = foods[index];
                        return FoodTile(food: food);
                      }),
                    ),
                  ),
        ),
      ),
    );
  }
}
