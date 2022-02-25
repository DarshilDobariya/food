import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/model/cart_model.dart';
import 'package:food/model/cart_model.dart';
import 'package:google_fonts/google_fonts.dart';

import '../blocs/cart/cart_bloc.dart';
import '../model/product_model.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;

  const CartProductCard(
      {Key? key, required this.product, required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              product.imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 18)),
                ),
                Text(
                  '\$${product.price}',
                  style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 18)),
                )
              ],
            ),
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Row(
                children: [
                  IconButton(
                      onPressed: () {
                        context
                            .read<CartBloc>()
                            .add(CartProductRemoved(product));
                        final snackbar = SnackBar(
                          duration: Duration(milliseconds: 500),
                          content: Text("Removed from cart.."),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      },
                      icon: Icon(Icons.remove_circle_outline_outlined)),
                  Text('${quantity}'),
                  IconButton(
                      onPressed: () {
                        context.read<CartBloc>().add(CartProductAdded(product));
                        final snackbar = SnackBar(
                          duration: Duration(milliseconds: 500),
                          content: Text("Added to cart.."),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      },
                      icon: Icon(Icons.add_circle_outline_outlined)),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
