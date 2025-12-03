import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodly/common/app_style.dart';
import 'package:foodly/common/custom_text_field.dart';
import 'package:foodly/common/reusable_text.dart';
import 'package:foodly/constants/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:foodly/hooks/fetch_restaurant.dart';
import 'package:foodly/views/restaurant/restaurant_page.dart';
import '../../common/custom_button.dart';
import '../../controllers/foods_controller.dart';
import '../../models/food_model.dart';
import 'package:get/get.dart';

import '../auth/phone_verification_page.dart';

class FoodDetailPage extends StatefulHookWidget {
  const FoodDetailPage({super.key, required this.food});

  final FoodModel food;

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  final TextEditingController _preferencesTextController =
      TextEditingController();
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchRestaurant(widget.food.restaurant);
    final controller = Get.put(FoodsController());

    return Scaffold(
      body: ListView(
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
                    Obx(() {
                      return ReusableText(
                        text:
                            "\$${(widget.food.price * controller.count.value).toStringAsFixed(2)}",
                        style: appStyle(18, kPrimary, FontWeight.w600),
                      );
                    }),
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
                          borderRadius: BorderRadius.all(Radius.circular(15.r)),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.w),
                            child: ReusableText(
                              text: tag,
                              style: appStyle(11, kLightWhite, FontWeight.w400),
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
                      tristate: false, // Only two states: checked and unchecked
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
                      style: appStyle(18, kDark, FontWeight.bold),
                    ),
                    SizedBox(width: 10.w),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.decrement();
                          },
                          child: Icon(AntDesign.minuscircleo, size: 20.sp),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ).w,
                          child: Obx(() {
                            return ReusableText(
                              text: '${controller.count.value}',
                              style: appStyle(14, kDark, FontWeight.w600),
                            );
                          }),
                        ),

                        GestureDetector(
                          onTap: () {
                            controller.increment();
                          },
                          child: Icon(AntDesign.pluscircleo, size: 20.sp),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 20.h),
                ReusableText(
                  text: 'Preferences',
                  style: appStyle(18, kDark, FontWeight.w600),
                ),

                SizedBox(height: 15.h),

                SizedBox(
                  height: 65.h,
                  child: CustomTextFieldWidget(
                    controller: _preferencesTextController,
                    hintText: 'Add a note with your preferences',
                    maxLines: 3,
                  ),
                ),

                SizedBox(height: 15.h),

                Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: kPrimary,
                    borderRadius: BorderRadius.all(Radius.circular(30.r)),
                  ),
                  child: Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showVerificationSheet(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                          child: ReusableText(
                            text: 'Place Order',
                            style: appStyle(18, kLightWhite, FontWeight.w600),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                          radius: 20.r,
                          backgroundColor: kSecondary,
                          child: Icon(
                            Ionicons.cart,
                            color: kLightWhite,
                            size: 20.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showVerificationSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      showDragHandle: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: 500.h,
          width: width,
          decoration: BoxDecoration(
            color: kLightWhite,
            image: DecorationImage(
              image: AssetImage('assets/images/restaurant_bk.png'),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              topRight: Radius.circular(12.r),
            ),
          ),
          child: Padding(
            padding: .all(8.h),
            child: Column(
              crossAxisAlignment: .center,
              children: [
                SizedBox(height: 10.h),
                ReusableText(
                  text: 'Verify Your Phone Number',
                  style: appStyle(18, kPrimary, FontWeight.w600),
                ),
                SizedBox(
                  height: 250.h,
                  child: Column(
                    children: List.generate(verificationReasons.length, (
                      index,
                    ) {
                      return ListTile(
                        title: Text(
                          verificationReasons[index],
                          textAlign: TextAlign.justify,
                          style: appStyle(11, kGrayLight, FontWeight.normal),
                        ),
                        leading: Icon(
                          Ionicons.checkmark_circle_outline,
                          color: kPrimary,
                        ),
                      );
                    }),
                  ),
                ),

                SizedBox(height: 10.h),

                CustomButton(
                  onTap: () {
                    Get.to(() => PhoneVerificationPage());
                  },
                  text: 'Verify Phone Number',
                  btnWidth: 200.w,
                  radius: 35.r,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
