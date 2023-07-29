import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:shopping_app/data/product_view_items.dart';

import 'package:shopping_app/screens/models/home_products.dart';

part 'productview_event.dart';
part 'productview_state.dart';

class ProductviewBloc extends Bloc<ProductviewEvent, ProductviewState> {
  ProductviewBloc() : super(ProductviewInitial()) {
    on<ProductviewInitialEvent>(productviewInitialEvent);
    on<ProductviewRemoveFromProductviewEvent>(productviewRemoveFromProductviewEvent);
  }

  FutureOr<void> productviewInitialEvent(
      ProductviewInitialEvent event, Emitter<ProductviewState> emit) {
    emit(ProductviewSuccessState(productItems:ProductViewItems ));
  }

  FutureOr<void> productviewRemoveFromProductviewEvent(
      ProductviewRemoveFromProductviewEvent event,
      Emitter<ProductviewState> emit) {
    ProductViewItems.remove(event.productDataModel);
// emit()
    emit(ProductviewSuccessState(productItems:ProductViewItems));
  }
}
