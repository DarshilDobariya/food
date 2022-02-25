import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/blocs/wishlist/wishlist_bloc.dart';
import 'package:food/model/model.dart';
import 'package:food/model/wishlist_model.dart';
import 'package:food/model/wishlist_model.dart';
import '../../widget/widgets.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => WishlistScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: CustomAppBar(
          title: 'WishList',
        ),
        body: BlocBuilder<WishlistBloc, WishlistState>(
          builder: (context, state) {
            if (state is WishlistLoading) {
              return Center(child: (CircularProgressIndicator()));
            }
            if (state is WishlistLoaded) {
              return GridView.builder(
                  // padding: EdgeInsets.symmetric(horizontal: 40),
                  itemCount: state.wishList.products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.only(top: 10),
                        child: Center(
                            child: ProductCard1(
                      product: state.wishList.products[index],
                      widthFactor: 1.2,
                      leftPositioned: 110,
                      isWishlist: true,
                    )));
                  });
            } else {
              return Text("Something went wrong");
            }
          },
        ),
        // bottomNavigationBar: CustomNavBar(),
      ),
    );
  }
}
