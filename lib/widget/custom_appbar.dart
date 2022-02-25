import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey[800],
      elevation: 0,
      title: Text(
        title,
        style: GoogleFonts.lato(
            textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      ),
      iconTheme: IconThemeData(color: Colors.white),
      actions: [Opacity(opacity: 0, child: Icon(Icons.home))],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}
