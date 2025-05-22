import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/heading.dart';
import 'widgets/category_list_widget.dart';
import '/common/custom_app_bar.dart';
import '/common/custom_container.dart';
import '/constants/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.h),
        child: CustomAppBar(),
      ),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Column(
            children: [
              CategoryListWidget(),
              Heading(
                text: "Nearby Restaurants",
                onTap: () {
                  // Navigate to all categories page
                },
              ),

              Heading(
                text: "Try Something New",
                onTap: () {
                  // Navigate to all categories page
                },
              ),

              Heading(
                text: "Food Closer to You",
                onTap: () {
                  // Navigate to all categories page
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
