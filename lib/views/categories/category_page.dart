import 'package:flutter/material.dart';
import 'package:foodly/constants/constants.dart';

import '../../common/reusable_text.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: ReusableText(
          text: "Category Page",
          fontSize: 12,
          color: kGray,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
      ),
      body: Center(),
    );
  }
}
