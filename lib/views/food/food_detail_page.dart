import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/constants/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../models/food_model.dart';

class FoodDetailPage extends StatefulWidget {
  const FoodDetailPage({super.key, required this.food});

  final FoodModel food;

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  @override
  Widget build(BuildContext context) {
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
                      child: Row(
                        children: List.generate(widget.food.imageUrl.length, (
                          index,
                        ) {
                          return Container(
                            margin: EdgeInsets.all(4.w),
                            height: 6.h,
                            width: 6.w,
                            decoration: BoxDecoration(
                              color: kSecondary,
                              shape: BoxShape.circle,
                            ),
                          );
                        }),
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
