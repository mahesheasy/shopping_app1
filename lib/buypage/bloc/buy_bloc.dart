import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:shopping_app/data/buy_items.dart';

import 'package:shopping_app/screens/models/home_products.dart';

part 'buy_event.dart';
part 'buy_state.dart';

class BuyBloc extends Bloc<BuyEvent, BuyState> {
  BuyBloc() : super(BuyInitial()) {
    on<BuyInitialEvent>(buyInitialEvent);
    on<BuyRemoveFromBuyEvent>(buyRemoveFrombuyEvent);
    on<BuyAddEvent>(buyAddEvent);
  }

  FutureOr<void> buyInitialEvent(
      BuyInitialEvent event, Emitter<BuyState> emit) {
    emit(
      BuySuccessState(buyItems: BuyListItems),
    );
  }

  FutureOr<void> buyRemoveFrombuyEvent(
      BuyRemoveFromBuyEvent event, Emitter<BuyState> emit) {
    BuyListItems.remove(event.productDataModel);
// emit()
    emit(
      BuySuccessState(buyItems: BuyListItems),
    );
  }

  FutureOr<void> buyAddEvent(BuyAddEvent event, Emitter<BuyState> emit) {
    emit(
      BuySuccessState(buyItems: BuyListItems),
    );
  }
}
