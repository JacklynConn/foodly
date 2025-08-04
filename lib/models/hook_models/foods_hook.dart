import 'package:flutter/material.dart';

class FetchFoods {
  final dynamic data;
  final bool isLoading;
  final Exception? error;
  final VoidCallback? refetch;

  FetchFoods({
    required this.data,
    required this.isLoading,
    this.error,
    this.refetch,
  });
}
