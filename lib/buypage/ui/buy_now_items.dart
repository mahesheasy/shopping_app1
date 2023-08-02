import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/buypage/ui/buy_items_widget.dart';
import 'package:shopping_app/cart/bloc/cart_bloc.dart';
import 'package:shopping_app/screens/models/home_products.dart';



class BuyNowPage extends StatefulWidget {
  const BuyNowPage({super.key, required ProductDataModel productDataModel});
  

  @override
  State<BuyNowPage> createState() => _BuyNowPageState();
}

class _BuyNowPageState extends State<BuyNowPage> {
  final CartBloc cartBloc = CartBloc();
    
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      final cartBloc = BlocProvider.of<CartBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Summary'),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listener: (context, state) {
          
        },
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return ListView.builder(
                  itemCount: successState.cartItems.length,
                  itemBuilder: (context, index) {
                    return BuyItemsWidget(
                        cartBloc: cartBloc,
                        productDataModel: successState.cartItems[index]);
                  });

            default:
          }
          return Container();
        },
      ),
    );
  }
}