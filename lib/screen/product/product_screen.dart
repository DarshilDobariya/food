import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/blocs/cart/cart_bloc.dart';
import 'package:food/model/model.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../blocs/wishlist/wishlist_bloc.dart';
import '../../widget/widgets.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';

  const ProductScreen({Key? key, required this.product}) : super(key: key);

  static Route route({required Product product}) {
    return MaterialPageRoute(
      builder: (_) => ProductScreen(product: product),
      settings: RouteSettings(name: routeName),
    );
  }

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: CustomAppBar(
          title: product.name,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListView(children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.65,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: [
                HeroCarouselCard(
                  product: product,
                )
              ].toList(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.blueGrey.withAlpha(100),
                      height: 45,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.blueGrey.withAlpha(100),
                      height: 45,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.name,
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                          Text(
                            '\$${product.price}',
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
              child: ExpansionTile(
                initiallyExpanded: false,
                title: Text(
                  'Product Information',
                  style: GoogleFonts.lato(fontSize: 18),
                ),
                children: [
                  ListTile(
                    title: Text(
                      product.desc,
                      style: GoogleFonts.lato(fontSize: 14),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: ExpansionTile(
                initiallyExpanded: false,
                title: Text(
                  'Delivery Information',
                  style: GoogleFonts.lato(fontSize: 18),
                ),
                children: [
                  ListTile(
                    title: Text(
                      'Delivery currently not available',
                      style: GoogleFonts.lato(fontSize: 14),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            )
          ]),
          // HeroCarouselCard(product: product,)
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blueGrey[800],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.share),
                color: Colors.white,
              ),
              BlocBuilder<WishlistBloc, WishlistState>(
                builder: (context, state) {
                  return IconButton(
                    onPressed: () {
                      context
                          .read<WishlistBloc>()
                          .add(AddWishListProducts(product));
                      final snackbar = SnackBar(
                        duration: Duration(milliseconds: 500),
                        content: Text("Added to Wishlist.."),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    },
                    icon: Icon(Icons.favorite_outlined),
                    color: Colors.white,
                  );
                },
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      context.read<CartBloc>().add(CartProductAdded(product));
                      Navigator.pushNamed(context, '/cart');
                    },
                    child: Text('Add to Cart'),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepOrange)),
                  );
                },
              )
            ],
          ),
        ),
        // bottomNavigationBar: CustomNavBar(),
      ),
    );
  }
}
