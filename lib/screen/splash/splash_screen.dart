import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import '../screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => SplashScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 10),()=>Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(
        builder: (BuildContext context) => HomeScreen(),
      ),
          (route) => false,)
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[800],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child:Lottie.asset(
                'assets/lottie/splash.json',
                width: 300,
                height: 300,
                fit: BoxFit.cover
            )),
            SizedBox(height: 10,),
            Container(child: Shimmer.fromColors(
                child: Text(
                      "FoodN'Drinks",
                      style: GoogleFonts.redHatDisplay(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              letterSpacing: 1)),
                    ),
                baseColor: Colors.grey.shade400,
                highlightColor: Colors.white),)
          ],
        ),
      ),
    );
  }
}
