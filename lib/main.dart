import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/constants/constants.dart';
import '/views/entrypoint.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 825),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Foodly',
          theme: ThemeData(
            scaffoldBackgroundColor: kOffWhite,
            iconTheme: IconThemeData(color: kDark),
            primarySwatch: Colors.grey,
          ),
          home: child,
        );
      },
      child: MainScreen(),
    );
  }
}
