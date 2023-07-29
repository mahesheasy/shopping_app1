// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopping_app/cart/cartitems.dart';
import 'package:shopping_app/consts/consts.dart';

import 'package:shopping_app/screens/bloc/home_bloc.dart';
import 'package:shopping_app/screens/ui/circular_avatar_widget.dart';

import 'package:shopping_app/screens/ui/product_sublist_widgets.dart';

import 'package:shopping_app/data/scrolling_images.dart';


import 'package:shopping_app/whishlist/whishlist.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // List<ProductDataModel> products = [];
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());

    super.initState();
  }

  HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartlistPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Cart()));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MyWhishList()));
        } else if (state is HomeProductItemWishlistedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Item saved"),
            ),
          );
        } else if (state is HomeProductItemCartedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Item Carted"),
            ),
          );
         } 
        //else if (state is ProductItemNavigateToProductItemViewedActionState) {
        //   Navigator.push(context,
        //       MaterialPageRoute(builder: (context) => const ProductItems()));
        // }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              ),
            );

          case HomeLoadedSuccessState:
            final SuccessState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text('shopping App'),
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeWhishlistButtonNavigateEvent());
                    },
                    icon: const Icon(Icons.favorite),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeCartButtonNavigateEvent());
                    },
                    icon: const Icon(Icons.shopping_bag_outlined),
                  ),
                  // IconButton(
                  //   onPressed: () {
                  //     homeBloc.add(ProductViewButtonNavigateEvent());
                  //   },
                  //   icon: const Icon(Icons.shopping_bag_outlined),
                  // ),
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const Divider(color: Colors.grey, thickness: 20),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          width: double.maxFinite,
                          height: 30,
                          color: Colors.blueGrey,
                          child: const Text(
                            "Delivering to _________ -500018 >",
                            style: TextStyle(fontSize: 18, fontFamily: bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CircularAvatar_widget(),
                    const SizedBox(height: 20),

                    SizedBox(
                      height: 200,
                      child: CarouselSlider(
                        items: Scrolling_urls.map((urls) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                ),
                                child: Image.network(
                                  urls,
                                  fit: BoxFit.fill,
                                ),
                              );
                            },
                          );
                        }).toList(),
                        options: CarouselOptions(
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          enlargeCenterPage: true,
                          aspectRatio: 25 / 9,
                          viewportFraction: 0.8,
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 10,
                    ),
                    const Card(
                      color: Color.fromARGB(255, 185, 34, 34),
                      margin: EdgeInsets.all(30),
                    ),
                    Product_category_row(
                      SuccessState: SuccessState,
                      itemCount: SuccessState.cloths.length,
                      productDataModel: SuccessState.cloths,
                    ),
                    Product_category_row(
                      SuccessState: SuccessState,
                      itemCount: SuccessState.electronics.length,
                      productDataModel: SuccessState.electronics,
                    ),
                    Product_category_row(
                      SuccessState: SuccessState,
                      itemCount: SuccessState.jackets.length,
                      productDataModel: SuccessState.jackets,
                    ),
                    Product_category_row(
                      SuccessState: SuccessState,
                      itemCount: SuccessState.tShirts.length,
                      productDataModel: SuccessState.tShirts,
                    ),
                    Product_category_row(
                      SuccessState: SuccessState,
                      itemCount: SuccessState.jewellery.length,
                      productDataModel: SuccessState.jewellery,
                    ),
                  ],
                ),
              ),
            );

          case HomeErrorState:
            return const Scaffold(
              body: Center(child: Text('Error')),
            );
          default:
            return Container();
        }
      },
    );
  }
}
