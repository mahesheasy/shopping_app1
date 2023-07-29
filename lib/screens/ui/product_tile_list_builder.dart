import 'package:flutter/material.dart';
import 'package:shopping_app/consts/consts.dart';
import 'package:shopping_app/screens/bloc/home_bloc.dart';
import 'package:shopping_app/screens/models/home_products.dart';
import 'package:shopping_app/view/product_view_page/product_view_items.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;

  const ProductTileWidget(
      {super.key, required this.productDataModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailScreen(
                      productDataModel: productDataModel,
                    )));
      },
      child: Container(
        width: 250,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 230,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        productDataModel.imageUrl,
                      ),

                 
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 6,
                  child: IconButton(
                    onPressed: () {
                      homeBloc.add(
                        HomeProductWhishlistButtonClickedEvent(
                          clickedProduct: productDataModel,
                        ),
                      );
                    },
                    icon: const Icon(Icons.favorite, color: Colors.blueGrey),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              productDataModel.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontFamily: bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  " ₹${productDataModel.price}",
                  style: const TextStyle(fontSize: 18, fontFamily: bold),
                ),
                //   IconButton(
                //     onPressed: () {
                //       homeBloc.add(
                //         HomeProductCartButtonClickedEvent(
                //             clickedProduct: productDataModel),
                //       );
                //     },
                //     icon: const Icon(Icons.shopping_cart_outlined),
                //   ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                const Padding(padding: EdgeInsets.all(10)),
                Container(
                  padding: const EdgeInsets.only(right: 2.0, left: 2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Text(
                    productDataModel.rate.toString(),
                    style: const TextStyle(
                        backgroundColor: Color.fromARGB(255, 9, 216, 16),
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
