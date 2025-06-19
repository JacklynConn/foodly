import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/shimmers/foodlist_shimmer.dart';
import '../../hooks/fetch_all_categories.dart';
import '../../models/categories_model.dart';
import '/views/category/widgets/category_tile.dart';
import '/common/background_container.dart';
import '/common/app_style.dart';
import '/common/reusable_text.dart';
import '/constants/constants.dart';

class AllCategories extends HookWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchAllCategories();
    List<CategoriesModel>? categoriesList = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;

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
          child:
              isLoading
                  ? FoodsListShimmer()
                  : ListView(
                    children: List.generate(categoriesList!.length, (index) {
                      CategoriesModel category = categoriesList[index];
                      return CategoryTile(category: category);
                    }),
                  ),
        ),
      ),
    );
  }
}
