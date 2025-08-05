import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../common/custom_container.dart';
import '../../common/custom_text_field.dart';
import '../../constants/constants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          backgroundColor: kOffWhite,
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
                onTap: () {},
                child: Icon(Ionicons.search_circle, size: 40.h, color: kGray),
              ),
            ),
          ),
        ),
        body: SafeArea(child: CustomContainer(containerContent: Container())),
      ),
    );
  }
}
