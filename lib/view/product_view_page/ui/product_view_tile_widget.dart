import 'package:flutter/material.dart';


import 'package:shopping_app/screens/models/home_products.dart';
import 'package:shopping_app/view/product_view_page/bloc/productview_bloc.dart';

class ProductViewWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final ProductviewBloc productviewBloc;

  const ProductViewWidget(
      {super.key,
      required this.productDataModel,
      required this.productviewBloc,
     });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(productDataModel.imageUrl),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            productDataModel.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(productDataModel.description),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${productDataModel.price}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  // IconButton(
                  //     onPressed: () {
                  //       productviewBloc.add((productviewBloc.state.
                  //          ));
                  //     },
                  //     icon: const Icon(Icons.favorite_border)),
                  // IconButton(
                  //   onPressed: () {
                  //     homebloc
                   
                  //   },
                   // icon: const Icon(Icons.shopping_bag_outlined),
                 // ),
                  IconButton(
                      onPressed: () {
                        productviewBloc.add(
                            ProductviewRemoveFromProductviewEvent(
                                productDataModel: productDataModel));
                      },
                      icon: const Icon(Icons.shopping_bag)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
