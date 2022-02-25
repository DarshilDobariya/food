import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/blocs/wishlist/wishlist_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../blocs/cart/cart_bloc.dart';
import '../model/model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double heightFactor;
  final double leftPositioned;
  final bool isWishlist;

  const ProductCard(
      {Key? key,
      required this.product,
      required this.widthFactor,
      required this.leftPositioned,
      this.isWishlist = false,
      this.heightFactor = 4})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;
    final double heightValue =
        MediaQuery.of(context).size.height / heightFactor;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: product);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Container(
              width: widthValue * 0.88,
              height: heightValue,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            // Positioned(
            //     top: 70,
            //     child: Container(
            //       width:widthFactor,
            //       height: 80,
            //       decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
            //     )),
            Positioned(
                top: 55,
                left: leftPositioned,
                height: 51,
                child: Container(
                  width: (widthValue * 0.88) - leftPositioned,
                  decoration: BoxDecoration(
                      color: Colors.black.withAlpha(180),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(color: Colors.white)),
                              ),
                              Text(
                                '\$${product.price}',
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      BlocBuilder<CartBloc, CartState>(
                        builder: (context, state) {
                          if (state is CartLoading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is CartLoaded) {
                            return Expanded(
                              child: IconButton(
                                onPressed: () {
                                  context
                                      .read<CartBloc>()
                                      .add(CartProductAdded(product));
                                  final snackbar = SnackBar(
                                    duration: Duration(milliseconds: 500),
                                    content: Text("Added to cart.."),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackbar);
                                },
                                icon: Icon(Icons.add_circle_outline_outlined),
                                color: Colors.white,
                              ),
                            );
                          } else {
                            return Text('Something went wrong');
                          }
                        },
                      ),
                      isWishlist
                          ? Expanded(
                              flex: 0,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.delete),
                                color: Colors.white,
                              ))
                          : SizedBox(),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class ProductCard1 extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double heightFactor;
  final double leftPositioned;
  final bool isWishlist;

  const ProductCard1(
      {Key? key,
      required this.product,
      required this.widthFactor,
      required this.leftPositioned,
      this.isWishlist = false,
      this.heightFactor = 4})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;
    final double heightValue =
        MediaQuery.of(context).size.height / heightFactor;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: product);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Container(
              width: widthValue * 1.1,
              height: heightValue,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            // Positioned(
            //     top: 70,
            //     child: Container(
            //       width:widthFactor,
            //       height: 80,
            //       decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
            //     )),
            Positioned(
                top: heightValue - 50,
                left: leftPositioned,
                height: 50,
                child: Container(
                  width: (widthValue * 1.1) - leftPositioned,
                  decoration: BoxDecoration(
                      color: Colors.black.withAlpha(180),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(color: Colors.white)),
                              ),
                              Text(
                                '\$${product.price}',
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: IconButton(
                          onPressed: () {
                            context
                                .read<CartBloc>()
                                .add(CartProductAdded(product));
                          },
                          icon: Icon(Icons.add_circle_outline_outlined),
                          color: Colors.white,
                        ),
                      ),
                      isWishlist
                          ? Expanded(
                              flex: 0,
                              child: IconButton(
                                onPressed: () {
                                  context
                                      .read<WishlistBloc>()
                                      .add(RemoveWishListProducts(product));
                                  final snackbar = SnackBar(
                                    duration: Duration(milliseconds: 500),
                                    content:
                                        Text("Discard from your wishlist..."),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackbar);
                                },
                                icon: Icon(Icons.delete),
                                color: Colors.white,
                              ))
                          : SizedBox(),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
