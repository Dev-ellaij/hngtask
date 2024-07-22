// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Details',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const ProductDetails(),
    );
  }
}

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Implement back button functionality here
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              // Implement cart button functionality here
            },
          ),
        ],
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 300, // Adjust height for smaller screens
                color: const Color(0xFFE4F5E0),
                child: const Padding(
                  padding: EdgeInsets.all(20.0), // Adjust padding
                  child: Column(
                    children: [
                      StackedImageCard(
                        backgroundImagePath:
                            'https://example.com/images/image30.png',
                        foregroundImagePath:
                            'https://example.com/images/CreamJarMockup.png',
                      ),
                    ],
                  ),
                ),
              ),
              const RowWithTwoImages(
                imagePath1:
                    'https://example.com/images/RepairScrubContainer.png',
                imagePath2: 'https://example.com/images/CarouselCard.png',
              ),
              const SizedBox(
                height: 20, // Adjust spacing
              ),
              const Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.0), // Adjust padding
                child: RowWithTwoTexts(
                  text1: 'RS34670',
                  text2: 'In Stock',
                ),
              ),
              const SizedBox(height: 20), // Adjust spacing
              const Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.0), // Adjust padding
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Repair Scrub',
                        style: TextStyle(
                          fontSize: 20, // Adjust font size
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10), // Adjust spacing
                    Text(
                      'Our Repair Body Scrub is expertly crafted to rejuvenate and revitalize your skin. This luxurious scrub combines natural exfoliants with nourishing ingredients to gently remove dead skin cells, promote cell renewal, and restore your skin\'s natural radiance.',
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14, // Adjust font size
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16), // Spacer
              const Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.0), // Adjust padding
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Made with pure natural ingredients',
                    style: TextStyle(
                      color: Color(0xFF4EAB35),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      letterSpacing: 1.68,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Spacer
              const Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.0), // Adjust padding
                child: SizedBox(
                  width: double.infinity, // Make the container take full width
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'How to use ',
                        style: TextStyle(
                          color: Color(0xFF343434),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16), // Spacer
              const Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.0), // Adjust padding
                child: SizedBox(
                  width: double.infinity, // Make the container take full width
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery and drop-off',
                        style: TextStyle(
                          color: Color(0xFF343434),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16), // Spacer
              Container(
                width: double.infinity, // Make the container take full width
                padding: const EdgeInsets.all(20.0), // Adjust padding
                decoration: const BoxDecoration(color: Color(0xFF408C2B)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sub',
                            style: TextStyle(
                              color: Color(0xFFFAFAFA),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '\$19.00',
                            style: TextStyle(
                              color: Color(0xFFFAFAFA),
                              fontSize: 18,
                              fontFamily: 'Lora',
                              fontWeight: FontWeight.w600,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Opacity(
                      opacity: 0.90,
                      child: Container(
                        width: 120, // Adjust width
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 2, color: Color(0xFFFAFAFA)),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Add to Cart',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFFAFAFA),
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RowWithTwoTexts extends StatelessWidget {
  final String text1;
  final String text2;

  const RowWithTwoTexts({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        Text(
          text2,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class RowWithTwoImages extends StatelessWidget {
  final String imagePath1;
  final String imagePath2;

  const RowWithTwoImages({
    Key? key,
    required this.imagePath1,
    required this.imagePath2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Image.network(
            imagePath1,
            width: 100, // Adjust width
            height: 100, // Adjust height
          ),
        ),
        Expanded(
          child: Image.network(
            imagePath2,
            width: 100, // Adjust width
            height: 100, // Adjust height
          ),
        ),
      ],
    );
  }
}

class StackedImageCard extends StatelessWidget {
  final String backgroundImagePath;
  final String foregroundImagePath;

  const StackedImageCard({
    super.key,
    required this.backgroundImagePath,
    required this.foregroundImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200, // Adjust height
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.all(10), // Adjust margin to reduce size
              child: Image.network(
                backgroundImagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            left: 40,
            top: 60,
            child: Image.network(
              foregroundImagePath,
              width: 160, // Adjust width
              height: 140, // Adjust height
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
