import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/constants/uidata.dart';
import '../../../constants/constants.dart';

class FoodList extends StatelessWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 194.h,
      padding: EdgeInsets.only(left: 12.w),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(foods.length, (index) {
          var food = foods[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150.h,
              width: 300.w,
              color: kPrimary,
              child: Image.network('${food['imageUrl']}', fit: BoxFit.cover),
            ),
          );
        }),
      ),
    );
  }
}
