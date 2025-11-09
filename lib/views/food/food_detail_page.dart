import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodly/constants/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../common/custom_button.dart';
import '../../controllers/foods_controller.dart';
import '../../models/food_model.dart';
import 'package:get/get.dart';

class FoodDetailPage extends StatefulWidget {
  const FoodDetailPage({super.key, required this.food});

  final FoodModel food;

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FoodsController());
    return Scaffold(
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.r),
                ),
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
                            children: List.generate(
                              widget.food.imageUrl.length,
                              (index) {
                                return Container(
                                  margin: EdgeInsets.all(4.w),
                                  height: 10.h,
                                  width: 10.w,
                                  decoration: BoxDecoration(
                                    color:
                                        controller.currentPage.value == index
                                            ? kSecondary
                                            : kGrayLight,
                                    shape: BoxShape.circle,
                                  ),
                                );
                              },
                            ),
                          );
                        }),
                      ),
                    ),

                    Positioned(
                      top: 40.h,
                      left: 12.w,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
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
                        onTap: () {},
                        btnWidth: 120.w,
                        radius: 25.r,
                        text: 'Open Restaurant',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
