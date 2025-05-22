import 'package:flutter/material.dart';
import '/constants/constants.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category Page'),
        centerTitle: true,
        backgroundColor: kOffWhite,
        elevation: 0,
      ),
      body: Center(
        child: Text('Category Page Content', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
