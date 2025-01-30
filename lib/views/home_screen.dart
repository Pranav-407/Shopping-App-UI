import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Product> products = [
    Product(
        image: 'assets/images/tangerine_shirt.png',
        title: 'Tangerine Shirt',
        price: 126.47,
        height: 194.00,
        width: 150.00),
    Product(
        image: 'assets/images/leather_coat.png',
        title: 'Leather Coat',
        price: 325.36,
        height: 140.00,
        width: 150.00),
    Product(
        image: 'assets/images/leather_coat_2.png',
        title: 'Tangerine Shirt',
        price: 126.47,
        height: 194.00,
        width: 150.00),
    Product(
        image: 'assets/images/tangerine_shirt_2.png',
        title: 'Leather Coat',
        price: 325.36,
        height: 140.00,
        width: 150.00),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset("assets/svg/Menu.svg"),
                  Spacer(),
                  SvgPicture.asset("assets/svg/Profile.svg"),
                ],
              ),
              SizedBox(height: 34),
              Text(
                "Explore",
                style: GoogleFonts.imprima(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Best trendy collection!",
                style: GoogleFonts.imprima(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(121, 119, 128, 1),
                ),
              ),
              SizedBox(height: 26),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 54,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 122, 0, 1),
                        borderRadius: BorderRadius.circular(90),
                      ),
                      child: Center(
                        child: Text(
                          "All",
                          style: GoogleFonts.imprima(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    ...["Mens", "Women", "Kids", "Others"].map(
                      (label) => Container(
                        margin: EdgeInsets.only(right: 12),
                        width: 58,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(90),
                        ),
                        child: Center(
                          child: Text(
                            label,
                            style: GoogleFonts.imprima(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 26),
              Expanded(
                child: MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ProductCard(product: products[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

   @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Main content column
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image container
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SizedBox(
                height: product.height,
                width: product.width,
                child: Image.asset(
                  product.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10), // Space for floating button
            // Product info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    product.title,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // Floating cart button
        Positioned(
          right: 30,
          bottom: 30, // Positioned between image and text
          child: GestureDetector(
            // onTap: onCartPressed,
            child: Container(
              height: 36,
                width: 36,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              child: Center(
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Product {
  final String title;
  final double price;
  final double height;
  final double width;
  final String image;

  Product({
    required this.title,
    required this.price,
    required this.width,
    required this.height,
    required this.image,
  });
}
