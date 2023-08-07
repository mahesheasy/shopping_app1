import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopping_app/cart/cartitems.dart';

import 'package:shopping_app/screens/models/home_products.dart';
import 'package:shopping_app/view/product_view_page/ui/bottom_sheet.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductDataModel productDataModel;

  const ProductDetailScreen({super.key, required this.productDataModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>   const Cart()), // Navigate to the cart screen
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300]!,
                      blurRadius: 4,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Container(
                  height: 280,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        productDataModel.imageUrl,
                       // fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productDataModel.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ExpandableText(
                    productDataModel.description,
                    expandText: 'Read more',
                    collapseText: 'Read less',
                    maxLines: 2,
                    linkColor: Colors.blueAccent,
                    linkStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${productDataModel.price}",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: productDataModel.rate,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 24,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rate) {
                          // Handle the rating update if needed
                          print(rate);
                        },
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Icon(
                        Icons.people,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(productDataModel.count.toString()),
                    ],
                  ),
                  const SizedBox(height: 15,),
                   const Text(
                          'In Stock',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                          ),
                        ),
                ],
              ),
            ),
            Divider(color: Colors.grey[400], height: 32),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Product Specifications",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              // child: Text(
              //   "Color: ${productDataModel.color}",
              //   style: TextStyle(fontSize: 18, color: Colors.grey[800]),
              // ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              // child: Text(
              //   "Size: ${productDataModel.size}",
              //   style: TextStyle(fontSize: 18, color: Colors.grey[800]),
              // ),
            ),
            // Add more specifications as needed
          ],
        ),
      ),
      //  bottomNavigationBar: BottomAppBar(height: 100,color: Colors.black),
      bottomSheet: CustomBottomSheet(
        productDataModel: productDataModel,
      ),
    );
  }
}
