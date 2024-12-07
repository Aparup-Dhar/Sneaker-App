import 'package:flutter/material.dart';

class CarouselItemData {
  final String imagePath;
  final String title;
  final String subtitle;
  final String price;
  final Color primaryColor;
  final Color secondaryColor;

  CarouselItemData({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.primaryColor,
    required this.secondaryColor,
  });
}

// Sample data for the carousel items
final List<CarouselItemData> carouselItems = [
  CarouselItemData(
    imagePath: 'assets/nike_7.png',
    title: 'Nike Victory Tour 3',
    subtitle: 'Golf Shoes',
    price: '\150.00',
    primaryColor: Colors.blue.shade600,
    secondaryColor: Colors.blue.shade300,
  ),
  CarouselItemData(
    imagePath: 'assets/nike_8.png',
    title: 'Jumpman MVP',
    subtitle: 'Mens Shoes',
    price: '\$125.00',
    primaryColor: Colors.red.shade600,
    secondaryColor: Colors.red.shade300,
  ),
  CarouselItemData(
    imagePath: 'assets/nike_9.png',
    title: 'Nike Dunk Low Retro Premium',
    subtitle: 'Mens Shoes',
    price: '\$100.00',
    primaryColor: Colors.yellow.shade600,
    secondaryColor: Colors.yellow.shade300,
  ),
];
