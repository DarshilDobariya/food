import 'package:flutter/material.dart';
import '../model/model.dart';
import 'widgets.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;

  const ProductCarousel({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 125,
        child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 9,vertical: 10),
            itemCount: products.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: ProductCard(product: products[index], widthFactor: 2.2, leftPositioned: 0,),
              );
            }));
  }
}
