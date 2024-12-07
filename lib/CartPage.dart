import 'package:flutter/material.dart';

List<Map<String, dynamic>> cart = [];

void addItem(String imagePath, String title, double price) {
  final newItem = {
    'imagePath': imagePath,
    'title': title,
    'price': price,
  };
  cart.add(newItem);  // Add item to global cart
}

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final GlobalKey<AnimatedListState> _animatedListKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    // Calculate total price
    double totalPrice = cart.fold(0, (sum, item) => sum + item['price']);

    return Scaffold(
      backgroundColor: Color(0xFFF9FBFC),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              "Your Cart",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Total Price and Checkout Button at the top
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Price:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Handle checkout
                  _checkout();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.shopping_cart_outlined, color: Colors.black),
                    SizedBox(width: 10),
                    Text(
                      'Checkout',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),  // Space between the checkout section and list

          // Cart Items List
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final item = cart[index];

                return Card(
                  color: Colors.white,
                  elevation: 5,  // Shadow for the card
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: CartItemWidget(
                    index: index,
                    imagePath: item['imagePath'],
                    title: item['title'],
                    price: item['price'],
                    onDelete: () {
                      _removeItem(index); // Remove item from cart
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Placeholder for checkout action
  void _checkout() {
    // Perform checkout actions here
    // For now, just showing a simple snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Checkout successful!')),
    );
  }

  // Method to remove item and update the total price
  void _removeItem(int index) {
    setState(() {
      cart.removeAt(index); // Remove item from cart
    });
  }
}

class CartItemWidget extends StatelessWidget {
  final int index;  // The index of the item
  final String imagePath;
  final String title;
  final double price;
  final VoidCallback onDelete;

  const CartItemWidget({
    Key? key,
    required this.index,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(imagePath),
      title: Text(title),
      subtitle: Text('\$${price.toStringAsFixed(2)}'),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        color: Colors.red,  // Default color is red
        onPressed: onDelete,  // Trigger the onDelete callback
      ),
    );
  }
}
