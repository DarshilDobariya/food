import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/model/checkout_model.dart';
import 'package:food/model/checkout_model.dart';
import 'package:food/widget/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../blocs/checkout/checkout_bloc.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';

  const CheckoutScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => CheckoutScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(
        title: 'Checkout',
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueGrey[800],
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CheckoutLoaded) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<CheckoutBloc>()
                          .add(ConfirmCheckout(checkout: state.checkout));
                    },
                    child: Text(
                      'Order Now',
                      style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 20)),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepOrange)),
                  ),
                ],
              );
            } else {
              return Center(
                child: Text("Something went wrong"),
              );
            }
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CheckoutLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CUSTOMER INFORMATION',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                  _buildTextFormField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(email: value));
                  }, context, 'Email'),
                  _buildTextFormField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(fullName: value));
                  }, context, 'Full Name'),
                  Text(
                    'DELIVERY INFORMATION',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                  _buildTextFormField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(address: value));
                  }, context, 'Address'),
                  _buildTextFormField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(city: value));
                  }, context, 'City'),
                  _buildTextFormField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(country: value));
                  }, context, 'Country'),
                  _buildTextFormField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(zipCode: value));
                  }, context, 'ZipCode'),
                  Text(
                    'ORDER SUMMARY',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                  OrderSummary(),
                ],
              );
            } else {
              return Center(
                child: Text("Something went wrong"),
              );
            }
          },
        ),
      ),
    );
  }

  Padding _buildTextFormField(
    Function(String)? onChanged,
    BuildContext context,
    String labelText,
  ) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 4,
            child: Text(labelText),
          ),
          Expanded(
              child: TextFormField(
            onChanged: onChanged,
            decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(left: 10),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.black,
                ))),
          ))
        ],
      ),
    );
  }
}
