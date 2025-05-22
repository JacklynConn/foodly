import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/common/app_style.dart';
import '/common/reusable_text.dart';
import '../../constants/constants.dart';

class AllFastestFoodsPage extends StatelessWidget {
  const AllFastestFoodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ReusableText(
          text: 'All FastestFoods',
          style: appStyle(13.sp, kGray, FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: kOffWhite,
        elevation: 0.3,
      ),
      body: Center(
        child: const Text(
          'All Fastest Foods Content',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
