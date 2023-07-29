part of 'productview_bloc.dart';

// abstract class ProductviewState extends Equatable {
//   const ProductviewState();
  
//   @override
//   List<Object> get props => [];
// }

// class ProductviewInitial extends ProductviewState {}



abstract class ProductviewState {}

abstract class ProductviewActionState extends ProductviewState {}

class ProductviewInitial extends ProductviewState {}

class ProductviewSuccessState extends ProductviewState {
  final List<ProductDataModel> productItems;
  ProductviewSuccessState({
    required this.productItems,
  });
  
}
class ProductItemNavigateToProductItemViewedActionState extends ProductviewState{}
class ProductItemViewedActionState extends ProductviewState{}