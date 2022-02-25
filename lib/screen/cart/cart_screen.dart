import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/blocs/cart/cart_bloc.dart';
import 'package:food/model/model.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../model/cart_model.dart';
import '../../widget/widgets.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => CartScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: CustomAppBar(
          title: 'Cart',
        ),
        body:BlocBuilder<CartBloc,CartState>(
          builder: (context, state) {
            if(state is CartLoading){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if(state is CartLoaded){
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              Cart().freeDeliveryString,
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold)),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/');
                                },
                                child: Text(
                                  "Add more items",
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(fontWeight: FontWeight.bold)),
                                ))
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height-319,
                            child: ListView.builder(
                                itemCount: state.cart.productQuantity(state.cart.products).keys.length,
                                itemBuilder: (context, index) {
                                  return CartProductCard(
                                      product:state.cart.productQuantity(state.cart.products).keys.elementAt(index) ,
                                      quantity:state.cart.productQuantity(state.cart.products).values.elementAt(index) ,);
                                })),
                      ],
                    ),
                    Column(
                      children: [
                        Divider(
                          thickness: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 10),
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
                                    '\$${state.cart.subtotalString }',
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
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              decoration:
                              BoxDecoration(color: Colors.black87.withAlpha(700)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total',
                                      style: GoogleFonts.lato(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                    Text(
                                      '\$${state.cart.totalString}',
                                      style: GoogleFonts.lato(
                                          fontSize: 18, color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              );
            }
            else{
              return Center(child: Text('Something went wrong'));
            }
          }),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blueGrey[800],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/checkout');
                },
                child: Text('Go to CheckOut',style: GoogleFonts.lato(textStyle: const TextStyle(fontSize: 20)),),
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Colors.deepOrange)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
