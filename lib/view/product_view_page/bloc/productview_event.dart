part of 'productview_bloc.dart';


abstract class ProductviewEvent {}

class ProductviewInitialEvent extends ProductviewEvent{
  
}


class ProductviewRemoveFromProductviewEvent extends ProductviewEvent {
  final ProductDataModel productDataModel;
  ProductviewRemoveFromProductviewEvent({
    required this.productDataModel,
  });
}