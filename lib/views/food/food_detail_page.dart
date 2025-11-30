import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodly/common/app_style.dart';
import 'package:foodly/common/reusable_text.dart';
import 'package:foodly/constants/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:foodly/hooks/fetch_restaurant.dart';
import 'package:foodly/views/restaurant/restaurant_page.dart';
import '../../common/custom_button.dart';
import '../../controllers/foods_controller.dart';
import '../../models/food_model.dart';
import 'package:get/get.dart';

class FoodDetailPage extends StatefulHookWidget {
  const FoodDetailPage({super.key, required this.food});

  final FoodModel food;

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchRestaurant(widget.food.restaurant);
    final controller = Get.put(FoodsController());

    return Scaffold(
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(30.r)),
            child: Stack(
              children: [
                SizedBox(
                  height: 230.h,
                  child: PageView.builder(
                    controller: pageController,
                    onPageChanged: (i) {
                      controller.changPage(i);
                    },
                    itemCount: widget.food.imageUrl.length,
                    itemBuilder: (context, i) {
                      return Container(
                        height: 230.h,
                        width: width,
                        color: kLightWhite,
                        child: CachedNetworkImage(
                          imageUrl: widget.food.imageUrl[i],
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),

                Positioned(
                  bottom: 10.h,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0).w,
                    child: Obx(() {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(widget.food.imageUrl.length, (
                          index,
                        ) {
                          return Container(
                            margin: EdgeInsets.all(4.w),
                            height: 10.h,
                            width: 10.w,
                            decoration: BoxDecoration(
                              color: controller.currentPage.value == index
                                  ? kSecondary
                                  : kGrayLight,
                              shape: BoxShape.circle,
                            ),
                          );
                        }),
                      );
                    }),
                  ),
                ),

                Positioned(
                  top: 40.h,
                  left: 12.w,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Ionicons.chevron_back_circle,
                      color: kPrimary,
                      size: 30.sp,
                    ),
                  ),
                ),

                Positioned(
                  bottom: 10.h,
                  right: 12.w,
                  child: CustomButton(
                    onTap: () {
                      Get.to(() => RestaurantPage(restaurant: hookResult.data));
                    },
                    btnWidth: 120.w,
                    radius: 25.r,
                    text: 'Open Restaurant',
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      ReusableText(
                        text: widget.food.title,
                        style: appStyle(18, kDark, FontWeight.w600),
                      ),
                      ReusableText(
                        text: "\$${widget.food.price.toStringAsFixed(2)}",
                        style: appStyle(18, kPrimary, FontWeight.w600),
                      ),
                    ],
                  ),

                  SizedBox(height: 5.h),
                  Text(
                    widget.food.description,
                    textAlign: TextAlign.justify,
                    maxLines: 8,
                    style: appStyle(11, kGray, FontWeight.w400),
                  ),

                  SizedBox(height: 5.h),

                  SizedBox(
                    height: 15.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(widget.food.foodTags.length, (
                        index,
                      ) {
                        final tag = widget.food.foodTags[index];
                        return Container(
                          margin: EdgeInsets.only(right: 5.w),
                          decoration: BoxDecoration(
                            color: kPrimary,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.r),
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                              child: ReusableText(
                                text: tag,
                                style: appStyle(
                                  11,
                                  kLightWhite,
                                  FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),

                  SizedBox(height: 15.h),

                  ReusableText(
                    text: 'Additives and Toppings',
                    style: appStyle(18, kDark, FontWeight.w600),
                  ),

                  SizedBox(height: 10.h),
                  Column(
                    children: List.generate(widget.food.additives.length, (
                      index,
                    ) {
                      final additive = widget.food.additives[index];
                      return CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        dense: true, // Reduces height of ListTile
                        value: true,
                        visualDensity:
                            VisualDensity.compact, // Further reduces height
                        activeColor: kPrimary,
                        tristate:
                            false, // Only two states: checked and unchecked
                        title: Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            ReusableText(
                              text: additive.title,
                              style: appStyle(11, kDark, FontWeight.w400),
                            ),
                            SizedBox(width: 10.w),
                            ReusableText(
                              text: "+\$${additive.price}",
                              style: appStyle(11, kPrimary, FontWeight.w600),
                            ),
                          ],
                        ),
                        onChanged: (bool? value) {},
                      );
                    }),
                  ),

                  SizedBox(height: 20.h),

                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      ReusableText(
                        text: 'Quantity:',
                        style: appStyle(11, kDark, FontWeight.w400),
                      ),
                      SizedBox(width: 10.w),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Icon(AntDesign.minuscircleo, size: 20.sp),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ).w,
                            child: ReusableText(
                              text: '0',
                              style: appStyle(12, kDark, FontWeight.w600),
                            ),
                          ),

                          GestureDetector(
                            onTap: () {},
                            child: Icon(AntDesign.pluscircleo, size: 20.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
