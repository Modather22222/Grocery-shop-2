
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/models/product_model.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductListingScreen extends StatelessWidget {
  const ProductListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: allProducts.length,
        itemBuilder: (context, index) {
          return _buildProductCard(context, allProducts[index]);
        },
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, Product product) {
    return GestureDetector(
      onTap: () => context.go('/product-details', extra: product),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(product.image,
                  height: 150, width: double.infinity, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name,
                      style: GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 5),
                  Text('\$${product.price.toStringAsFixed(2)}',
                      style: GoogleFonts.lato(
                          fontSize: 15, color: const Color(0xFF32a852), fontWeight: FontWeight.w600)),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 18),
                      const SizedBox(width: 4),
                      Text(product.rating.toString(), style: GoogleFonts.lato(fontSize: 14)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Mock Data
final List<Product> allProducts = [
  Product(name: 'Apple', image: 'assets/images/apple.png', price: 1.99, rating: 4.5),
  Product(name: 'Banana', image: 'assets/images/banana.png', price: 0.99, rating: 4.8),
  Product(name: 'Orange', image: 'assets/images/orange.png', price: 1.49, rating: 4.2),
  Product(name: 'Veggies', image: 'assets/images/veggies.png', price: 2.49, rating: 4.0),
  Product(name: 'Fruits', image: 'assets/images/fruits.png', price: 3.00, rating: 4.7),
  Product(name: 'Meat', image: 'assets/images/meat.png', price: 5.99, rating: 4.9),
  Product(name: 'Dairy', image: 'assets/images/dairy.png', price: 2.99, rating: 4.3),
];
