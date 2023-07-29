import 'package:flutter/material.dart';
import 'package:shopping_app/consts/consts.dart';
import 'package:shopping_app/screens/bloc/home_bloc.dart';
import 'package:shopping_app/screens/models/home_products.dart';
import 'package:shopping_app/screens/ui/product_tile_list_builder.dart';

class Product_category_row extends StatelessWidget {
  const Product_category_row({
    super.key,
    required this.SuccessState,
    required this.itemCount,
    required this.productDataModel,
  });

  final HomeLoadedSuccessState SuccessState;
  final int itemCount;
  final List<ProductDataModel> productDataModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Colors.black,
          thickness: 20,
        ),
        // Container(
        //   color: Colors.blueGrey,
        //   padding: const EdgeInsets.all(20),
        //   child: const Text(
        //     "Products For You",
        //     textAlign: TextAlign.start,
        //     style: TextStyle(fontFamily: bold, fontSize: 10,),
        //   ),
        // ),
        // Container(
        //   child: Stack(
        
        //     children:  const[
        //       Text(
        //         "Products For You",
        //         textAlign: TextAlign.start,
                
        
        //         style: TextStyle(
        //           fontFamily: bold,
        //           fontSize: 30,
        //           backgroundColor: Colors.blue
                  
        //         ),
        //       ),
        
        //     ],
        //   ),
        // ),
        SizedBox(
          height: 350,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: itemCount,
              itemBuilder: (context, index) {
                return ProductTileWidget(
                  homeBloc: HomeBloc(),
                  productDataModel: productDataModel[index],
                );
              }),
        ),
      ],
    );
  }
}
