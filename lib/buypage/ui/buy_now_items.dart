import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/buypage/bloc/buy_bloc.dart';
import 'package:shopping_app/buypage/ui/buy_bottom_sheet.dart';
import 'package:shopping_app/buypage/ui/buy_items_widget.dart';
import 'package:shopping_app/cart/bloc/cart_bloc.dart';

import 'package:shopping_app/screens/models/home_products.dart';

class BuyNowPage extends StatefulWidget {
  final ProductDataModel productDataModel;
    final CartBloc cartBloc; 

  const BuyNowPage({
    Key? key,
    required this.productDataModel, required this.cartBloc,
  }) : super(key: key);

  @override
  State<BuyNowPage> createState() => _BuyNowPageState();
}

class _BuyNowPageState extends State<BuyNowPage> {
  

  @override
  // void initState() {
  //   buyBloc.add(BuyInitialEvent());
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
  //  final buyBloc = BlocProvider.of<BuyBloc>(context);
  final cartBloc=BlocProvider.of<CartBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Summary'),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: widget.cartBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          if (state is CartSuccessState) {
            return ListView.builder(
              itemCount: state.cartItems.length,
              itemBuilder: (context, index) {
                return BuyItemsWidget(
                 
                 
                  productDataModel: state.cartItems[index],
                );
              },
            );
          } else {
            return Container();
          }
         
          
        },
      ),
      bottomSheet: BuyBottomSheet(
        productDataModel: widget.productDataModel,
      ),
    );
  }
}
