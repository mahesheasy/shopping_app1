part of 'home_bloc.dart';

abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> products;
  final List<ProductDataModel> cloths;
  final List<ProductDataModel> jewellery;
  final List<ProductDataModel> electronics;
  final List<ProductDataModel> jackets;
  final List<ProductDataModel> tShirts;

  HomeLoadedSuccessState({
    required this.products,
  })  : cloths = products.sublist(0, 4),
        jewellery = products.sublist(4, 8),
        electronics = products.sublist(8, 14),
        jackets = products.sublist(14, 17),
        tShirts = products.sublist(17, products.length);
  @override
  List<Object?> get props => [products];
}

class HomeErrorState extends HomeState {
  final String errorMessage;

  HomeErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartlistPageActionState extends HomeActionState {}

class HomeProductItemWishlistedActionState extends HomeActionState {}

class HomeProductItemCartedActionState extends HomeActionState {}

