import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodly/common/shimmers/foodlist_shimmer.dart';
import 'package:foodly/views/search/loading_widget.dart';
import 'package:foodly/views/search/search_result.dart';
import '/controllers/search_food_controller.dart';
import '../../common/custom_container.dart';
import '../../common/custom_text_field.dart';
import '../../constants/constants.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodController());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: kPrimary,
        appBar: AppBar(
          toolbarHeight: 74.h,
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Padding(
            padding: EdgeInsets.only(top: 12),
            child: CustomTextFieldWidget(
              controller: _searchController,
              keyboardType: TextInputType.text,
              hintText: 'Search for Food',
              contentPadding: EdgeInsets.symmetric(
                vertical: 14.h,
                horizontal: 10.w,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  controller.searchFoods(_searchController.text);
                },
                child: Icon(Ionicons.search_circle, size: 40.h, color: kGray),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: CustomContainer(
            color: Colors.white,
            containerContent:
                controller.isLoading
                    ? FoodsListShimmer()
                    : controller.searchResults == null
                    ? LoadingWidget()
                    : SearchResult(),
          ),
        ),
      ),
    );
  }
}
