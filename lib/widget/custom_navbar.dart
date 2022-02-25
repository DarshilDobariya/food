import 'package:flutter/material.dart';


class CustomNavBar extends StatelessWidget {
      @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.blueGrey[800],
      child: Container(
        height: 43,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context,'/wishlist');
                },
                icon: Icon(
                  Icons.favorite_outlined,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context,
                      '/cart');
                },
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context,
                      '/user');
                },
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}


