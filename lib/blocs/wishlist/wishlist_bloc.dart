import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:food/model/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/wishlist_model.dart';

part 'wishlist_event.dart';

part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading());

  @override
  Stream<WishlistState> mapEventToState(
    WishlistEvent event,
  ) async* {
    if (event is StartWishList) {
      yield* _mapStartWishlistToState();
    } else if (event is AddWishListProducts) {
      yield* _mapAddWishlistToState(event, state);
    } else if (event is RemoveWishListProducts) {
      yield* _mapRemoveWishlistToState(event, state);
    }
  }

  Stream<WishlistState> _mapStartWishlistToState() async* {
    yield WishlistLoading();
    try {
      await Future<void>.delayed(Duration(seconds: 1));
      yield WishlistLoaded();
    } catch (_) {}
  }

  Stream<WishlistState> _mapAddWishlistToState(
      AddWishListProducts event, WishlistState state) async* {
    if (state is WishlistLoaded) {
      try {
        yield WishlistLoaded(
            wishList: WishList(
                products: List.from(state.wishList.products)
                  ..add(event.product)));
      } catch (_) {}
    }
  }

  Stream<WishlistState> _mapRemoveWishlistToState(
      RemoveWishListProducts event, WishlistState state) async* {
    if (state is WishlistLoaded) {
      try {
        yield WishlistLoaded(
            wishList: WishList(
                products: List.from(state.wishList.products)
                  ..remove(event.product)));
      } catch (_) {}
    }
  }
}
