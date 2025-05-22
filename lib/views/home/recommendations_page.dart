import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/app_style.dart';
import '../../common/reusable_text.dart';
import '../../constants/constants.dart';

class RecommendationsPage extends StatelessWidget {
  const RecommendationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ReusableText(
          text: 'Recommendations',
          style: appStyle(13.sp, kGray, FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: kOffWhite,
        elevation: 0.3,
      ),
      body: Center(
        child: const Text(
          'All Recommendations',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
