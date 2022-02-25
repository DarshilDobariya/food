import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/blocs/cart/cart_bloc.dart';
import 'package:food/blocs/category/category_bloc.dart';
import 'package:food/blocs/checkout/checkout_bloc.dart';
import 'package:food/blocs/product/product_bloc.dart';
import 'package:food/blocs/wishlist/wishlist_bloc.dart';
import 'package:food/config/app_router.dart';
import 'package:food/repositories/category/category_repository.dart';
import 'package:food/repositories/product/product_repository.dart';
import 'package:food/screen/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'repositories/checkout/checkout_repository.dart';
import 'screen/screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishList())),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(
          create: (context) => CheckoutBloc(
              cartBloc: context.read<CartBloc>(),
              checkoutRepository: CheckoutRepository()),
        ),
        BlocProvider(
            create: (_) => CategoryBloc(
                  categoryRepository: CategoryRepository(),
                )..add(LoadCategories())),
        BlocProvider(
            create: (_) => ProductBloc(productRepository: ProductRepository())
              ..add(LoadProducts())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
        home: HomeScreen(),
      ),
    );
  }
}
