import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:http/http.dart' as http;

import 'package:shopping_app/data/cart_items.dart';

import 'package:shopping_app/data/wishlist_items.dart';
import 'package:shopping_app/screens/models/home_products.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeProductWhishlistButtonClickedEvent>(
        homeProductWhishlistButtonClickedEvent);
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWhishlistButtonNavigateEvent>(homeWhishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
   
  }
  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(
      const Duration(seconds: 2),
    );

    List<ProductDataModel> products;
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        products = data.map((e) {
          return ProductDataModel(
              id: e['id'],
              name: e["title"],
              description: e['description'],
              price: e['price'],
              imageUrl: e['image'],
              rate: e['rating']['rate'],
              count: e['rating']['count']);
        }).toList();

        emit(HomeLoadedSuccessState(products: products));
      } else {
        // Handle API error
        emit(HomeErrorState(errorMessage: 'failed to fetch '));
      }
    } catch (e) {
      // Handle exceptions
      emit(HomeErrorState(errorMessage: 'Error: $e'));
    }
  }

  FutureOr<void> homeProductWhishlistButtonClickedEvent(
      HomeProductWhishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print("whishList product clicked");
    WhishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('cartlist product clicked');
    CartListItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeWhishlistButtonNavigateEvent(
      HomeWhishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("whishList navigate clicked");
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('cartlist navigate clicked');
    emit(HomeNavigateToCartlistPageActionState());
  }

  
}
