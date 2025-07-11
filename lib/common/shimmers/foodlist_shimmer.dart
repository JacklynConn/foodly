import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/shimmers/shimmer_widget.dart';
import 'package:foodly/constants/constants.dart';

class FoodsListShimmer extends StatelessWidget {
  const FoodsListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, top: 10),
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.zero,
        itemCount: 6,
        itemBuilder: (context, index) {
          return ShimmerWidget(
            shimmerWidth: width,
            shimmerHeight: 70.h,
            shimmerRadius: 12,
          );
        },
      ),
    );
  }
}
