import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../blocs/category/category_bloc.dart';
import '../../blocs/product/product_bloc.dart';
import '../../widget/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => HomeScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            backgroundColor: Colors.blueGrey[800],
            title: Shimmer.fromColors(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.layers),
                    Text(
                      "FoodN'Drinks",
                      style: GoogleFonts.redHatDisplay(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              letterSpacing: 1)),
                    ),
                  ],
                ),
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.white),
            // actions: [
            //   IconButton(
            //       onPressed: () {
            //         Navigator.pushReplacementNamed(context, '/wishlist');
            //       },
            //       icon: Icon(Icons.home))
            // ],
          ),
          bottomNavigationBar: CustomNavBar(),
          body: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Column(
                  children: [
                    Container(child: BlocBuilder<CategoryBloc, CategoryState>(
                      builder: (context, state) {
                        if (state is CategoryLoading) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is CategoryLoaded) {
                          return CarouselSlider(
                            options: CarouselOptions(
                              aspectRatio: 1.65,
                              viewportFraction: 0.9,
                              enlargeCenterPage: true,
                              enlargeStrategy: CenterPageEnlargeStrategy.height,
                            ),
                            items: state.categories
                                .map((category) =>
                                HeroCarouselCard(category: category))
                                .toList(),
                          );
                        } else {
                          return Center(
                            child: Text("Something went wrong"),
                          );
                        }
                      },
                    )),
                    SectionTile(title: 'RECOMENDED'),
                    //product carousel
                    // ProductCard(product :Product.products[0],
                    BlocBuilder<ProductBloc, ProductState>(
                      builder: (context, state) {
                        if (state is ProductLoading) {
                          return Center(
                              child: CircularProgressIndicator()
                          );
                        }
                        if (state is ProductLoaded) {
                          return ProductCarousel(
                              products: state.products
                                  .where((product) => product.isRecommended)
                                  .toList());
                        }
                        else{return Center(
                          child: Text("Something went Wrong.."),
                        );}
                      },
                    ),
                    SectionTile(title: 'Most Popular'),
                    BlocBuilder<ProductBloc, ProductState>(
                      builder: (context, state) {
                        if (state is ProductLoading) {
                          return Center(
                              child: CircularProgressIndicator()
                          );
                        }
                        if (state is ProductLoaded) {
                          return ProductCarousel(
                              products: state.products
                                  .where((product) => product.isPopular)
                                  .toList());
                        }
                        else{return Center(
                          child: Text("Something went Wrong.."),
                        );}
                      },
                    ),
                  ],
                );
              }),
        ));
  }
}
