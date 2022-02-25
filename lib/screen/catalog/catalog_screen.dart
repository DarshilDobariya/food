import 'package:flutter/material.dart';
import 'package:food/model/category_model.dart';
import 'package:food/model/model.dart';
import '../../widget/widgets.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  const CatalogScreen({Key? key, required this.category}) : super(key: key);

  static Route route({required Category category}) {
    return MaterialPageRoute(
      builder: (_) => CatalogScreen(
        category: category,
      ),
      settings: RouteSettings(name: routeName),
    );
  }

  final Category category;

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products.where((product) => product.category == category.name).toList();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
          appBar: CustomAppBar(
            title: category.name,
          ),
          // bottomNavigationBar: CustomNavBar(),
          body: GridView.builder(
              padding: EdgeInsets.symmetric(vertical: 20),
              itemCount: categoryProducts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4,
                  mainAxisSpacing: 40),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    child: Center(child: ProductCard(product: categoryProducts[index], widthFactor: 2.2, leftPositioned: 0,)));
              })),
    );
  }
}
