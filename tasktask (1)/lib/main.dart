// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:tasktask/productdetails.dart';
import 'package:tasktask/screens/order_history.dart';
import 'package:tasktask/screens/wishlist.dart';
import 'package:tasktask/screens/first_cart_page.dart'; // Import FirstCartPage
import 'package:tasktask/screens/last_cart_page.dart'; // Import LastCartPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int cartItemCount = 0;
  List<String> items = [
    'Repair Scrub',
    'Hydrate Cream',
    'Sunscreen',
    'Serum',
    'Cleanser'
  ];
  List<String> filteredItems = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    filteredItems = items;
  }

  void addToCart() {
    setState(() {
      cartItemCount++;
    });
  }

  void filterItems(String query) {
    setState(() {
      filteredItems = items
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const MyHomePage()));
        break;
      case 1:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const OrderHistoryScreen()));
        break;
      case 2:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const WishlistScreen()));
        break;
      case 3:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProductDetails()));
        break;
      case 4:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const MyHomePage())); // Navigate to CartScreen with tabs
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sharrie’s Signature',
          style: TextStyle(
            color: Color(0xFF408C2B),
            fontSize: 24,
            fontFamily: 'Redressed',
            fontWeight: FontWeight.w400,
            height: 1.05,
          ),
        ),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const MyHomePage())); // Navigate to CartScreen with tabs
                },
              ),
              if (cartItemCount > 0)
                Positioned(
                  right: 4,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '$cartItemCount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Search',
                style: TextStyle(
                  color: Color(0xFF363939),
                  fontSize: 18,
                  fontFamily: 'Lora',
                  fontWeight: FontWeight.w600,
                  height: 1.07,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                onChanged: filterItems,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Our Products',
                style: TextStyle(
                  color: Color(0xFF363939),
                  fontSize: 18,
                  fontFamily: 'Lora',
                  fontWeight: FontWeight.w600,
                  height: 1.07,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 270, // Adjust height from 250 to 270
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: filteredItems.map((item) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProductDetails()),
                            ),
                            child: Container(
                              width: 180,
                              height: 220, // Adjust height as needed
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Center(
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    color: Color(0xFF0A0B0A),
                                    fontSize: 24,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    height: 0.04,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Repair Scrub',
                            style: TextStyle(
                              color: Color(0xFF797A7B),
                              fontSize: 10,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 0.15,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '\$19.00',
                                style: TextStyle(
                                  color: Color(0xFF363939),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  height: 0.11,
                                ),
                              ),
                              GestureDetector(
                                onTap: addToCart,
                                child: Container(
                                  width: 80,
                                  height: 24,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6.31),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 0.79,
                                          color: Color(0xFF408C2B)),
                                      borderRadius: BorderRadius.circular(2.37),
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Add to Cart',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF408C2B),
                                        fontSize: 10,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        height: 0.08,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Deals',
                style: TextStyle(
                  color: Color(0xFF363939),
                  fontSize: 18,
                  fontFamily: 'Lora',
                  fontWeight: FontWeight.w600,
                  height: 1.07,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProductDetails()),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 180,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Center(
                              child: Text(
                                '1',
                                style: TextStyle(
                                  color: Color(0xFF0A0B0A),
                                  fontSize: 24,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  height: 0.04,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            '50% OFF',
                            style: TextStyle(
                              color: Color(0xFF797A7B),
                              fontSize: 10,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 0.15,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Get the latest deals on our products!',
                            style: TextStyle(
                              color: Color(0xFF363939),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 0.11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        height: 60,
        backgroundColor: Colors.green,
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.history, title: 'History'),
          TabItem(icon: Icons.favorite, title: 'Wishlist'),
          TabItem(icon: Icons.shopping_cart, title: 'Cart'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        initialActiveIndex: _currentIndex,
        onTap: onTabTapped,
      ),
    );
  }
}
