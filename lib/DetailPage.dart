import 'package:flutter/material.dart';
import 'package:flutter_gnav/HomePage.dart';
import 'package:flutter_gnav/ShopPage.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'CartPage.dart';

class DetailPage extends StatefulWidget {
  final String title;
  final String subtitle;
  final String price;
  final String imagePath;
  final Color primaryColor;
  final Color secondaryColor;

  const DetailPage({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imagePath,
    required this.primaryColor,
    required this.secondaryColor,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Color? selectedColor = Colors.yellow;
  String? selectedSize = '37';
  bool isHeartFilled = false;
  bool isDialogOpen = false; // Track if dialog is open

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Info container at the bottom
          Positioned.fill(
            top: 300, // Ensure space for the image container
            child: Container(
              margin: EdgeInsets.only(top: 60),
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.price,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.subtitle,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Color',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          _buildColorOption(Colors.yellow),
                          _buildColorOption(Colors.purple),
                          _buildColorOption(Colors.pink),
                          _buildColorOption(Colors.red),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Size',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          _buildSizeOption('37'),
                          _buildSizeOption('38'),
                          _buildSizeOption('39'),
                          _buildSizeOption('40'),
                          _buildSizeOption('41'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        addItem(widget.imagePath, widget.title, double.parse(widget.price.replaceAll('\$', '')));
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Added to Cart!'))
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: Colors.black,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.shopping_cart_outlined, color: Colors.white),
                          SizedBox(width: 10),
                          Text(
                            'Add to Cart',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Image container
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(0, 10),
                    blurRadius: 20,
                    spreadRadius: 4,
                  ),
                ],
                gradient: LinearGradient(
                  colors: [widget.primaryColor, widget.secondaryColor],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              height: 350,
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(widget.imagePath),
                  ),
                  Positioned(
                    top: 20,
                    left: 10,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  // Heart icon button at the top right
                  Positioned(
                    top: 20,
                    right: 10,
                    child: IconButton(
                      icon: Icon(
                        isHeartFilled ? Icons.favorite : Icons.favorite_border,
                        color: isHeartFilled ? Colors.red : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          isHeartFilled = !isHeartFilled;
                        });
                      },
                    ),
                  ),
                  // New Icon below the heart
                  Positioned(
                    top: 60,
                    right: 10,
                    child: IconButton(
                      icon: Icon(
                        Icons.aspect_ratio,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _showDialog();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Dialog Box
  void _showDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            height: 600,
            width: 400,
            child: Stack(
              children: [
                ModelViewer(
                  interactionPrompt: InteractionPrompt.none,
                  autoRotateDelay: 0,
                  backgroundColor: Colors.red.shade300,
                  src: "assets/nike_jordan_air_max.glb",
                  alt: 'Nike Air Jordan',
                  ar: false,
                  autoRotate: true,
                  rotationPerSecond: "1.0rad",
                  disableZoom: true,
                ),
                Positioned(
                  top: -0,
                  right: -0,
                  child: IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildColorOption(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: selectedColor == color ? Colors.black : Colors.transparent,
            width: 2,
          ),
        ),
        child: CircleAvatar(
          radius: 15,
          backgroundColor: color,
        ),
      ),
    );
  }

  Widget _buildSizeOption(String size) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSize = size;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: selectedSize == size ? Colors.black : Colors.grey[200],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          size,
          style: TextStyle(
            color: selectedSize == size ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
