import 'package:flutter/material.dart';
import 'package:flutter_gnav/DetailPage.dart';
import 'GridItemData.dart';
import 'GridItemDesign.dart';
import 'CarouselSliderWidget.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.black),
        onPressed: () {
          // Handle menu tap
        },
      ),
      title: Center(
        child: Image.asset(
          'assets/logo.jpg', // Replace with your logo asset path
          height: 40,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications, color: Colors.black),
          onPressed: () {  },
        ),
      ],
    ),
      backgroundColor: Color(0xFFF9FBFC),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'New Arrivals',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5), // Add some space below the text
            Container(
              height: 250, // Adjust height as needed
              child: CarouselSliderWidget(),
            ),
            SizedBox(height: 10), // Add some space between carousel and grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'Collections',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GridView.builder(
              padding: const EdgeInsets.all(15.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of items in a row
                mainAxisExtent: 230,
                crossAxisSpacing: 10,
                mainAxisSpacing: 15,
              ),
              itemCount: gridItems.length, // Use the length of the grid items list
              itemBuilder: (context, index) {
                final item = gridItems[index]; // Get the item at the current index
                return GestureDetector(
                  onTap: () {
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
                  child: GridItemDesign(
                    imagePath: item.imagePath,
                    title: item.title,
                    subtitle: item.subtitle,
                    price: item.price,
                    primaryColor: item.primaryColor,
                    secondaryColor: item.secondaryColor,
                  ),
                );
              },
              shrinkWrap: true, // Make the grid view wrap its content
              physics: NeverScrollableScrollPhysics(), // Prevent the grid from scrolling independently
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
