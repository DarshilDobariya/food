import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/model/category_model.dart';
import 'package:food/model/model.dart';
import 'package:food/screen/cart/cart_screen.dart';
import 'package:food/screen/catalog/catalog_screen.dart';
import 'package:food/screen/home/home_screen.dart';
import 'package:food/screen/product/product_screen.dart';
import 'package:food/screen/screen.dart';

import '../widget/widgets.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings){
    print('Route is :${settings.name}');
    switch(settings.name){
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case WishlistScreen.routeName:
        return WishlistScreen.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text("ERROR"),),
        // bottomNavigationBar: CustomNavBar(),
        backgroundColor: Colors.black,),
      settings: RouteSettings(name: '/error'),
    );
  }
}