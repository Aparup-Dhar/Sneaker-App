import 'package:flutter/material.dart';

class GridItemDesign extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String price;
  final Color primaryColor;
  final Color secondaryColor;

  const GridItemDesign({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.primaryColor,
    required this.secondaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [primaryColor, secondaryColor], // Dynamic gradient colors
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Centered Image with Rotation
            Center(
              child: Transform.rotate(
                angle: -25 * 3.1416 / 180, // Convert 35 degrees to radians
                child: Image.asset(
                  imagePath, // Use the passed image path
                  width: 150,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 20),            // Text Content
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              price,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
