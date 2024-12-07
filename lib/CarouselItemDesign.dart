import 'package:flutter/material.dart';

class CarouselItemDesign extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String price;
  final Color primaryColor;
  final Color secondaryColor;

  const CarouselItemDesign({
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
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [primaryColor, secondaryColor],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text Section on the Left and Vertically Centered
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // This will center the text vertically
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    price,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20), // Added some spacing between text and image
            // Centered Image on the Right with Rotation
            Transform.rotate(
              angle: -25 * 3.1416 / 180, // Convert -25 degrees to radians
              child: Image.asset(
                imagePath,
                width: 150,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
