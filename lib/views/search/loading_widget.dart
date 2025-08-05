import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../constants/constants.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Padding(
        padding: EdgeInsets.only(bottom: 180),
        child: LottieBuilder.asset(
          "assets/anime/delivery.json",
          width: width,
          height: height / 2,
        ),
      ),
    );
  }
}
