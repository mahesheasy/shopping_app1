import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/buypage/ui/buy_now_items.dart';
import 'package:shopping_app/cart/bloc/cart_bloc.dart';


import 'package:shopping_app/screens/bloc/home_bloc.dart';
import 'package:shopping_app/screens/models/home_products.dart';
import 'package:shopping_app/snackbar/show_snack_bar.dart';

class CustomBottomSheet extends StatelessWidget {
  final ProductDataModel productDataModel;
  const CustomBottomSheet({Key? key, required this.productDataModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    final cartBloc = BlocProvider.of<CartBloc>(context);
    return Container(
      height: 80,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.grey, Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  homeBloc.add(
                    HomeProductCartButtonClickedEvent(
                      clickedProduct: productDataModel,
                    ),
                  );

                  showSnackbar(context, 'Added to Cart');
                },
                borderRadius: BorderRadius.circular(8),
                child: const Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      'Add to Cart',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  //cartBloc.add(CartAddEvent(productDataModel: productDataModel));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BuyNowPage(
                        productDataModel: productDataModel,
                      ),
                    ),
                  );
                  homeBloc.add(
                    HomeProductCartButtonClickedEvent(
                      clickedProduct: productDataModel,
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(8),
                child: const Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.shopping_bag,
                      color: Colors.white,
                      size: 32,
                    ),
                    Text(
                      'Buy Now',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
