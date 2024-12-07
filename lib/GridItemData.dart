import 'package:flutter/material.dart';

class GridItemData {
  final String imagePath;
  final String title;
  final String subtitle;
  final String price;
  final Color primaryColor;
  final Color secondaryColor;

  const GridItemData({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.primaryColor,
    required this.secondaryColor,
  });
}

// List of grid items
List<GridItemData> gridItems = [
  GridItemData(
    imagePath: 'assets/nike_1.png',
    title: 'Nike G.T. Jump 2',
    subtitle: 'Mens Basketball Shoes',
    price: '\$120.00',
    primaryColor: Colors.green.shade700,
    secondaryColor: Colors.green.shade300,
  ),
  GridItemData(
    imagePath: 'assets/nike_2.png',
    title: 'Nike Zoom Fly 6',
    subtitle: 'Mens Road Racing Shoes',
    price: '\$170.00',
    primaryColor: Colors.pink.shade500,
    secondaryColor: Colors.pink.shade200,
  ),
  GridItemData(
    imagePath: 'assets/nike_3.png',
    title: 'Jordan Spizike Low',
    subtitle: 'Mens Shoes',
    price: '\$200.00',
    primaryColor: Colors.grey.shade800,
    secondaryColor: Colors.grey.shade400,
  ),
  GridItemData(
    imagePath: 'assets/nike_4.png',
    title: 'Nike Book 1 "Sunset"',
    subtitle: 'Basketball Shoes',
    price: '\$140.00',
    primaryColor: Colors.purple.shade600,
    secondaryColor: Colors.purple.shade300,
  ),
  GridItemData(
    imagePath: 'assets/nike_5.png',
    title: 'Nike Zoom Vapor Cage 4',
    subtitle: 'Tennis Shoes',
    price: '\$150.00',
    primaryColor: Colors.blue.shade600,
    secondaryColor: Colors.blue.shade300,
  ),
  GridItemData(
    imagePath: 'assets/nike_6.png',
    title: 'Air Jordan I High G',
    subtitle: 'Mens Golf Shoes',
    price: '\$120.00',
    primaryColor: Colors.yellow.shade600,
    secondaryColor: Colors.yellow.shade300,
  ),

];
