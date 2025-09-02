import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/reusable_text.dart';
import 'package:foodly/constants/constants.dart';

import '../../common/app_style.dart';
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
                  bottomLeft: Radius.circular(30.r),
                  bottomRight: Radius.circular(30.r),
                ),
                child: Stack(
                  children: [Container(height: 230.h, color: kGray)],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
