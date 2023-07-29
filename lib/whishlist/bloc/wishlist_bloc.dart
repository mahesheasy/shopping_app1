// import 'package:bloc/bloc.dart';
// import 'package:shopping_app/data/wishlist_items.dart';

// part 'wishlist_event.dart';
// part 'wishlist_state.dart';

// class Whishlist extends Bloc<CartEvent, CartState> {
//   Whishlist() : super(WishlistInitial()) {
//     on<WishInitialEvent>(cartInitialEvent);
//     on<Wishlistremovelist>(Wishlistremovelist);
//   }

//   FutureOr<void> cartInitialEvent(
//       CartInitialEvent event, Emitter<WishlistEvent> emit) {
//     emit(WishListSuccessState(cartItems: WhishlistItems));
//   }

//   FutureOr<void> Wishlistremovelist(
//       Wishlistremovelist event, Emitter<CartState> emit) {
//     CartListItems.remove(event.productDataModel);
// // emit()
//     emit(CartSuccessState(cartItems: CartListItems));
//   }
// }
