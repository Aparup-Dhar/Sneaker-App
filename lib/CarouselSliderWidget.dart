import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'CarouselItemDesign.dart';
import 'CarouselItemData.dart';
import 'DetailPage.dart'; // Ensure you import the DetailPage class.

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({Key? key}) : super(key: key);

  @override
  _CarouselSliderWidgetState createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CarouselSlider(
            items: carouselItems.map((item) {
              return GestureDetector(
                onTap: () {
                  // Navigate to DetailPage when the item is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        title: item.title,
                        subtitle: item.subtitle,
                        price: item.price,
                        imagePath: item.imagePath,
                        primaryColor: item.primaryColor,
                        secondaryColor: item.secondaryColor,
                      ),
                    ),
                  );
                },
                child: CarouselItemDesign(
                  imagePath: item.imagePath,
                  title: item.title,
                  subtitle: item.subtitle,
                  price: item.price,
                  primaryColor: item.primaryColor,
                  secondaryColor: item.secondaryColor,
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: double.infinity,
              viewportFraction: 1.0,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: carouselItems.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => setState(() => _currentIndex = entry.key),
              child: Container(
                width: 30.0, // Set the width of the rounded line
                height: 5.0, // Set the height of the rounded line
                margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0), // Makes the line rounded
                  color: _currentIndex == entry.key
                      ? Colors.black
                      : Colors.grey, // Change color based on current index
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
