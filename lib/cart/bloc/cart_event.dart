part of 'cart_bloc.dart';

abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartAddEvent extends CartEvent {
  final ProductDataModel productDataModel;
  CartAddEvent({
    required this.productDataModel,
  });
}

class CartRemoveFromCartEvent extends CartEvent {
  final ProductDataModel productDataModel;
  CartRemoveFromCartEvent({
    required this.productDataModel,
  });
}
