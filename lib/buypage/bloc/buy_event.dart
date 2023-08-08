part of 'buy_bloc.dart';

class BuyEvent {}
class BuyInitialEvent extends BuyEvent {}

class BuyAddEvent extends BuyEvent {
  final ProductDataModel productDataModel;
  BuyAddEvent({
    required this.productDataModel,
  });
}

class BuyRemoveFromBuyEvent extends BuyEvent {
  final ProductDataModel productDataModel;
   BuyRemoveFromBuyEvent({
    required this.productDataModel,
  });
}

