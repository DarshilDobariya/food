import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../blocs/cart/cart_bloc.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
  builder: (context, state) {
    if(state is CartLoading){
      return Center(child: CircularProgressIndicator(),);
    }
    if(state is CartLoaded) {
      return Column(
        children: [
          Divider(
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'SubTotal',
                      style: GoogleFonts.lato(fontSize: 16),
                    ),
                    Text(
                      '\$${state.cart.subtotalString}',
                      style: GoogleFonts.lato(fontSize: 16),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery Fees',
                      style: GoogleFonts.lato(fontSize: 16),
                    ),
                    Text(
                      '\$${state.cart.deliveryFeeString}',
                      style: GoogleFonts.lato(fontSize: 16),
                    )
                  ],
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 50,
                decoration: BoxDecoration(color: Colors.black87.withAlpha(700)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style:
                        GoogleFonts.lato(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        '\$${state.cart.totalString}',
                        style:
                        GoogleFonts.lato(fontSize: 18, color: Colors.white),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      );
    }
    else{
      return Center(child: Text('Something Went Wrong..'),);
    }
  },
);
  }
}
