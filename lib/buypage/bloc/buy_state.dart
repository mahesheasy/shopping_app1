part of 'buy_bloc.dart';

abstract class BuyState {}
abstract class BuyActionState extends BuyState {}

class BuyInitial extends BuyState {}

class BuySuccessState extends BuyState {
  final List<ProductDataModel> buyItems;
  BuySuccessState({
    required this.buyItems,
  });
}
