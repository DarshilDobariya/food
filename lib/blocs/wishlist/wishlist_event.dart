part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class StartWishList extends WishlistEvent{

  @override
  List<Object> get props => [];
}

class AddWishListProducts extends WishlistEvent{

  final Product product;
  const AddWishListProducts(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveWishListProducts  extends WishlistEvent{

  final Product product;
  const RemoveWishListProducts(this.product);

  @override
  List<Object> get props => [product];
}