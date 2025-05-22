import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/constants/uidata.dart';
import '/views/home/widgets/food_widget.dart';

class FoodList extends StatelessWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.h,
      padding: EdgeInsets.only(left: 12.w),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(foods.length, (index) {
          var food = foods[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: FoodWidget(
              image: '${food['imageUrl']}',
              title: '${food['title']}',
              time: '${food['time']}',
              price: '${food['price']}',
              onTap: () {
                // Handle tap event
                print('Tapped on ${food['title']}');
              },
            ),
          );
        }),
      ),
    );
  }
}
