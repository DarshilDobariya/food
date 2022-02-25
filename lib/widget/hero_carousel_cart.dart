import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/category_model.dart';
import '../model/model.dart';

class HeroCarouselCard extends StatelessWidget {
  final Category? category;
  final Product? product;
  const HeroCarouselCard({
    this.category,
    this.product,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        this.product != null
            ? null
            : Navigator.pushNamed(context, '/catalog', arguments: category);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            child: Stack(
              children: <Widget>[
                Image.network(
                    product == null ? category!.imageUrl : product!.imageUrl,
                    fit: BoxFit.cover,
                    width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text(product == null ? category!.name : '',
                        style: GoogleFonts.assistant(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}