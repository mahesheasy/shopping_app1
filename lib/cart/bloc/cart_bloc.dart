import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:shopping_app/data/cart_items.dart';


import 'package:shopping_app/screens/models/home_products.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems:CartListItems ));
  }

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    CartListItems.remove(event.productDataModel);
// emit()
    emit(CartSuccessState(cartItems: CartListItems));
  }
}