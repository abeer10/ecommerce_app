import 'dart:async';
import 'package:ecommerce_app/model/cart_model.dart';
import 'package:ecommerce_app/ui/screens/cart/provider/cart_provider.dart';
import 'package:ecommerce_app/ui/screens/cart/state/cart_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Cart Controller to manage all cart CRUD

class CartController extends AsyncNotifier<CartState> {

  // local cartItem list
  List<CartModel> cartItems = [];

  @override
  FutureOr<CartState> build() {
    getCartItems();
    return CartState([]);
  }

  // get all cart items from state
  getCartItems() {
    state = const AsyncLoading();
    if (state.value == null) {
      state = AsyncData(CartState([]));
    } else {
      ref.watch(cartTotalProvider.notifier).state = 0;
      cartItems = List.of(state.value!.cartItems);
      state = AsyncData(CartState(cartItems));
    }
  }

  // add items to cart
  addItem(CartModel cartItem) {
    state = const AsyncLoading();
    cartItems.add(cartItem);
    state = AsyncData(CartState(cartItems));
  }

  // update items to cart

  updateItem(CartModel cartItem) {
    state = const AsyncLoading();
    cartItems = List.of(state.value!.cartItems);
    // find index of item and then replace with updated item
    int i = cartItems.indexWhere((element)=> element.name == cartItem.name);
    if(i>=0){
      cartItems.removeAt(i);
      cartItems.insert(i, cartItem);
    }
    state = AsyncData(CartState(cartItems));
  }

  //delete items from cart
  deleteItem(CartModel cartItem) {
    state = const AsyncLoading();
    cartItems = List.of(state.value!.cartItems);
    if (cartItems.contains(cartItem)) {
      cartItems.remove(cartItem);
    }
    state = AsyncData(CartState(cartItems));
  }
}
