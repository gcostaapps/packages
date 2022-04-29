import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class AppShadows {
  static List<BoxShadow> shadowSmallAll = [
    BoxShadow(
      color: Colors.black.withOpacity(0.08),
      blurRadius: 12,
    ),
  ];

  static List<BoxShadow> shadowSmallRight = [
    BoxShadow(
      color: Colors.black.withOpacity(0.04),
      blurRadius: 6,
      offset: const Offset(6, 0),
    ),
  ];

  static List<BoxShadow> shadowSmall = [
    BoxShadow(
      color: Colors.black.withOpacity(0.04),
      blurRadius: 10,
      offset: const Offset(0, 6),
    ),
  ];

  static List<BoxShadow> shadowMedium = [
    BoxShadow(
      color: Colors.black.withOpacity(0.04),
      blurRadius: 20,
      offset: const Offset(0, 16),
    ),
  ];
}
