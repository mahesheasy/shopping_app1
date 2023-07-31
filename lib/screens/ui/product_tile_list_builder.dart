import 'package:flutter/material.dart';

import 'package:shopping_app/consts/consts.dart';
import 'package:shopping_app/screens/bloc/home_bloc.dart';
import 'package:shopping_app/screens/models/home_products.dart';
import 'package:shopping_app/view/product_view_page/product_view_items.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;

  const ProductTileWidget({
    Key? key,
    required this.productDataModel,
    required this.homeBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              productDataModel: productDataModel,
            ),
          ),
        );
      },
      child: Container(
        width: 250,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2), // shadow direction: bottom
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 260,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(16)),
                    image: DecorationImage(
                    //  fit: BoxFit.cover,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productDataModel.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontFamily: bold, fontSize: 18),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${productDataModel.price}",
                        style: const TextStyle(fontFamily: bold, fontSize: 18),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: const Color.fromARGB(255, 9, 216, 16),
                        ),
                        child: Text(
                          productDataModel.rate.toString(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: bold),
                        ),
                      ),
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
