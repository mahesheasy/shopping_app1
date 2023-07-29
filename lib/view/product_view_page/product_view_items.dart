// import 'package:flutter/material.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:shopping_app/view/product_view_page/bloc/productview_bloc.dart';
// import 'package:shopping_app/view/product_view_page/ui/product_view_tile_widget.dart';

// class ProductItems extends StatefulWidget {
//   const ProductItems({super.key});

//   @override
//   State<ProductItems> createState() => _ProductItemsState();
// }

// class _ProductItemsState extends State<ProductItems> {
//   final ProductviewBloc productviewBloc= ProductviewBloc();
//   @override
//   void initState() {
//     productviewBloc.add(ProductviewInitialEvent());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('details'),
//       ),
//       body: BlocConsumer<ProductviewBloc, ProductviewState>(
//         bloc: productviewBloc,
//         listener: (context, state) {

//         },
//         listenWhen: (previous, current) => current is ProductviewActionState,
//         buildWhen: (previous, current) => current is! ProductviewActionState,
//         builder: (context, state) {
//           switch (state.runtimeType) {
//             case ProductviewSuccessState:
//               final successState = state as ProductviewSuccessState;
//               return ListView.builder(
//                   itemCount: successState.productItems.length,
//                   itemBuilder: (context, index) {
//                     return ProductViewWidget(
//                      productviewBloc   : productviewBloc,
//                         productDataModel: successState.productItems[index]);
//                   });

//             default:
//           }
//           return Container();
//         },
//       ),
//     );
//   }
// }

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopping_app/screens/models/home_products.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductDataModel productDataModel;

  const ProductDetailScreen({super.key, required this.productDataModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      productDataModel.imageUrl,
                      fit: BoxFit.cover,
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
                    linkColor: Colors.blue,
                    linkStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "₹${productDataModel.price}",
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
                    ],
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
      bottomSheet: const CustomBottomSheet(),
    );
  }
}

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50, // Height of the custom bottom sheet container
      color: Colors.blueAccent, // Background color of the container
      padding: const EdgeInsets.symmetric(horizontal: 20),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: () {
              // Add functionality for the cart button here
              // For example, you can navigate to the cart screen
              // Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.blue, minimumSize: Size(150, 50)),
            child: const Text(
              'Add to Cart',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Add functionality for the buy button here
              // For example, you can show a confirmation dialog or process the purchase
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.green, minimumSize: Size(150, 50)),
            child: const Text(
              'Buy Now',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
