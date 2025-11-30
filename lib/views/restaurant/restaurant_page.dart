import 'package:flutter/material.dart';
import 'package:foodly/models/restaurants_model.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({super.key, this.restaurant});

  final RestaurantsModel? restaurant;

  @override
  Widget build(BuildContext context) {
    print(restaurant!.coords.address);
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
